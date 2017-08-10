//
//  ViewController.swift
//  SegueSudoku
//
//  Created by Phanindra purighalla on 28/07/17.
//  Copyright © 2017 Aarna Solutions Inc. All rights reserved.
//

import UIKit
import AWSDynamoDB

class ViewController: UIViewController {
    
    var easyColor = UIColor(red: 175/255, green: 175/255, blue: 175/255, alpha: 1)
    var mediumColor = UIColor(red: 125/255, green: 125/255, blue: 125/255, alpha: 1)
    var hardColor = UIColor(red: 75/255, green: 75/255, blue: 75/255, alpha: 1)
    var premiumColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    
    
    var premiumMatrix = [[" "," "," "," "," "," "," "," "," "],
                  [" "," "," "," "," "," "," "," "," "],
                  [" "," "," "," "," "," "," "," "," "],
                  [" "," "," "," "," "," "," "," "," "],
                  [" "," "," "," "," "," "," "," "," "],
                  [" "," "," "," "," "," "," "," "," "],
                  [" "," "," "," "," "," "," "," "," "],
                  [" "," "," "," "," "," "," "," "," "],
                  [" "," "," "," "," "," "," "," "," "]]
    
    var solvedPremiumMatrix = [[" "," "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "," "]]
    
    

    @IBAction func EasyButtonPressed(_ sender: UIButton) {
        
        let puzzlesVC = storyboard?.instantiateViewController(withIdentifier: "PuzzlesViewController") as! PuzzlesViewController
        puzzlesVC.puzzle1ButtonTitle = "Easy 1"
        puzzlesVC.puzzle2ButtonTitle = "Easy 2"
        puzzlesVC.puzzle3ButtonTitle = "Easy 3"
        puzzlesVC.puzzle4ButtonTitle = "Easy 4"
        puzzlesVC.puzzle5ButtonTitle = "Easy 5"
        puzzlesVC.bgColor = easyColor
        
        navigationController?.pushViewController(puzzlesVC, animated: true)
    }
    
    
    @IBAction func MediumButtonPressed(_ sender: UIButton) {
        
        let puzzlesVC = storyboard?.instantiateViewController(withIdentifier: "PuzzlesViewController") as! PuzzlesViewController
        puzzlesVC.puzzle1ButtonTitle = "Medium 1"
        puzzlesVC.puzzle2ButtonTitle = "Medium 2"
        puzzlesVC.puzzle3ButtonTitle = "Medium 3"
        puzzlesVC.puzzle4ButtonTitle = "Medium 4"
        puzzlesVC.puzzle5ButtonTitle = "Medium 5"
        puzzlesVC.bgColor = mediumColor
        
        navigationController?.pushViewController(puzzlesVC, animated: true)
        
    }
    
    @IBAction func HardButtonPressed(_ sender: UIButton) {
        
        let puzzlesVC = storyboard?.instantiateViewController(withIdentifier: "PuzzlesViewController") as! PuzzlesViewController
        puzzlesVC.puzzle1ButtonTitle = "Hard 1"
        puzzlesVC.puzzle2ButtonTitle = "Hard 2"
        puzzlesVC.puzzle3ButtonTitle = "Hard 3"
        puzzlesVC.puzzle4ButtonTitle = "Hard 4"
        puzzlesVC.puzzle5ButtonTitle = "Hard 5"
        puzzlesVC.bgColor = hardColor
        
        navigationController?.pushViewController(puzzlesVC, animated: true)
    }
    
    func retrievePremiumPuzzle() {
        
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        
        dynamoDBObjectMapper.load(PremiumPuzzles.self, hashKey: "10Aug2017_E1", rangeKey:nil).continueOnSuccessWith(block: { (task:AWSTask<AnyObject>!) -> Any? in
            if let error = task.error as NSError? {
                print("The request failed. Error: \(error)")
            } else if let resultSudokuPuzzle = task.result as? PremiumPuzzles {
                
                DispatchQueue.main.async {
                    self.handleRequest(resultSudokuPuzzle: resultSudokuPuzzle)
                }
            }
            return nil
        })
    }
    
    func handleRequest(resultSudokuPuzzle: PremiumPuzzles) {
        
        ActivityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
        
        self.premiumMatrix = resultSudokuPuzzle.Matrix
        self.solvedPremiumMatrix = resultSudokuPuzzle.SolvedMatrix
        
        let sudokuVC = self.storyboard?.instantiateViewController(withIdentifier: "SudokuViewController") as! SudokuViewController
        
        
        sudokuVC.originalMatrix = self.premiumMatrix
        sudokuVC.matrix = sudokuVC.originalMatrix
        sudokuVC.solvedMatrix = self.solvedPremiumMatrix
        sudokuVC.puzzleName = "Premium"
        sudokuVC.bgColor = self.premiumColor
        self.navigationController?.pushViewController(sudokuVC, animated: true)
    }
    
    @IBAction func PremiumButtonPressed(_ sender: UIButton) {
        
        ActivityIndicator.startAnimating()
        
        view.isUserInteractionEnabled = false
        
        retrievePremiumPuzzle()
        
    }
    
    
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHome(unwindSegue: UIStoryboardSegue) {
        
    }

}

