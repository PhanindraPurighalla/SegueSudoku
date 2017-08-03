//
//  PuzzlesViewController.swift
//  SegueSudoku
//
//  Created by Phanindra purighalla on 29/07/17.
//  Copyright © 2017 Aarna Solutions Inc. All rights reserved.
//

import UIKit

class PuzzlesViewController: UIViewController {
    
    var puzzle1ButtonTitle = ""
    var puzzle2ButtonTitle = ""
    var puzzle3ButtonTitle = ""
    var puzzle4ButtonTitle = ""
    var puzzle5ButtonTitle = ""
    
    var sudokuEasy1 = [["2","7","0","0","0","8","3","0","0"],
                       ["0","0","0","7","0","0","0","8","0"],
                       ["0","0","0","0","0","0","0","5","1"],
                       ["7","0","0","6","0","1","0","9","5"],
                       ["8","0","0","4","2","3","0","0","7"],
                       ["1","4","0","5","0","7","0","0","8"],
                       ["9","1","0","0","0","0","0","0","0"],
                       ["0","6","0","0","0","5","0","0","0"],
                       ["0","0","3","8","0","0","0","1","9"]]
    
    var sudokuEasy1SolvedMatrix = [["2","7","9","1","5","8","3","4","6"],
                        ["3","5","1","7","4","6","9","8","2"],
                        ["6","8","4","2","3","9","7","5","1"],
                        ["7","3","2","6","8","1","4","9","5"],
                        ["8","9","5","4","2","3","1","6","7"],
                        ["1","4","6","5","9","7","2","3","8"],
                        ["9","1","8","3","6","2","5","7","4"],
                        ["4","6","7","9","1","5","8","2","3"],
                        ["5","2","3","8","7","4","6","1","9"]]
    
    var sudokuEasy2 = [["0","0","8","0","2","0","7","0","0"],
                       ["0","0","2","3","0","8","6","0","4"],
                       ["0","0","0","5","0","6","0","9","8"],
                       ["0","0","7","0","0","9","0","0","6"],
                       ["4","0","0","0","0","0","0","0","1"],
                       ["6","0","0","2","0","0","8","0","0"],
                       ["5","2","0","4","0","3","0","0","0"],
                       ["7","0","6","1","0","5","3","0","0"],
                       ["0","0","1","0","6","0","4","0","0"]]
    
    var sudokuEasy2SolvedMatrix = [["0","0","8","0","2","0","7","0","0"],
                       ["0","0","2","3","0","8","6","0","4"],
                       ["0","0","0","5","0","6","0","9","8"],
                       ["0","0","7","0","0","9","0","0","6"],
                       ["4","0","0","0","0","0","0","0","1"],
                       ["6","0","0","2","0","0","8","0","0"],
                       ["5","2","0","4","0","3","0","0","0"],
                       ["7","0","6","1","0","5","3","0","0"],
                       ["0","0","1","0","6","0","4","0","0"]]
    

    @IBOutlet weak var Puzzle1Button: UIButton!
    @IBAction func Puzzle1ButtonPressed(_ sender: UIButton) {
        let sudokuVC = storyboard?.instantiateViewController(withIdentifier: "SudokuViewController") as! SudokuViewController
        
        switch puzzle1ButtonTitle {
            case "Easy 1":
            sudokuVC.originalMatrix = sudokuEasy1
            sudokuVC.matrix = sudokuEasy1
            sudokuVC.solvedMatrix = sudokuEasy1SolvedMatrix
        case "Medium 1":
            sudokuVC.originalMatrix = sudokuEasy2
            sudokuVC.matrix = sudokuEasy2
            sudokuVC.solvedMatrix = sudokuEasy1SolvedMatrix //TODO:
        default:
            break
        }
        navigationController?.pushViewController(sudokuVC, animated: true)
    }
    
    @IBOutlet weak var Puzzle2Button: UIButton!
    @IBAction func Puzzle2ButtonPressed(_ sender: UIButton) {
        let sudokuVC = storyboard?.instantiateViewController(withIdentifier: "SudokuViewController") as! SudokuViewController
        
        switch puzzle2ButtonTitle {
        case "Easy 2":
            sudokuVC.originalMatrix = sudokuEasy2
            sudokuVC.matrix = sudokuEasy2
            sudokuVC.solvedMatrix = sudokuEasy2SolvedMatrix
        case "Medium 2":
            sudokuVC.originalMatrix = sudokuEasy2
            sudokuVC.matrix = sudokuEasy2
            sudokuVC.solvedMatrix = sudokuEasy1SolvedMatrix //TODO:
        default:
            break
        }
        navigationController?.pushViewController(sudokuVC, animated: true)
    }
    
    @IBOutlet weak var Puzzle3Button: UIButton!
    @IBAction func Puzzle3ButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var Puzzle4Button: UIButton!
    @IBAction func Puzzle4ButtonPressed(_ sender: UIButton) {
    }
    
    @IBOutlet weak var Puzzle5Button: UIButton!
    @IBAction func Puzzle5ButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Puzzle1Button.setTitle(puzzle1ButtonTitle, for: .normal)
        Puzzle2Button.setTitle(puzzle2ButtonTitle, for: .normal)
        Puzzle3Button.setTitle(puzzle3ButtonTitle, for: .normal)
        Puzzle4Button.setTitle(puzzle4ButtonTitle, for: .normal)
        Puzzle5Button.setTitle(puzzle5ButtonTitle, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
