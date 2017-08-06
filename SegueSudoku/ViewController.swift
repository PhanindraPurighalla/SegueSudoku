//
//  ViewController.swift
//  SegueSudoku
//
//  Created by Phanindra purighalla on 28/07/17.
//  Copyright © 2017 Aarna Solutions Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func EasyButtonPressed(_ sender: UIButton) {
        
        let puzzlesVC = storyboard?.instantiateViewController(withIdentifier: "PuzzlesViewController") as! PuzzlesViewController
        puzzlesVC.puzzle1ButtonTitle = "Easy 1"
        puzzlesVC.puzzle2ButtonTitle = "Easy 2"
        puzzlesVC.puzzle3ButtonTitle = "Easy 3"
        puzzlesVC.puzzle4ButtonTitle = "Easy 4"
        puzzlesVC.puzzle5ButtonTitle = "Easy 5"
        puzzlesVC.bgColor = UIColor.magenta
        
        navigationController?.pushViewController(puzzlesVC, animated: true)
    }
    
    
    @IBAction func MediumButtonPressed(_ sender: UIButton) {
        
        let puzzlesVC = storyboard?.instantiateViewController(withIdentifier: "PuzzlesViewController") as! PuzzlesViewController
        puzzlesVC.puzzle1ButtonTitle = "Medium 1"
        puzzlesVC.puzzle2ButtonTitle = "Medium 2"
        puzzlesVC.puzzle3ButtonTitle = "Medium 3"
        puzzlesVC.puzzle4ButtonTitle = "Medium 4"
        puzzlesVC.puzzle5ButtonTitle = "Medium 5"
        puzzlesVC.bgColor = UIColor.purple
        
        navigationController?.pushViewController(puzzlesVC, animated: true)
        
    }
    
    @IBAction func HardButtonPressed(_ sender: UIButton) {
        
        let puzzlesVC = storyboard?.instantiateViewController(withIdentifier: "PuzzlesViewController") as! PuzzlesViewController
        puzzlesVC.puzzle1ButtonTitle = "Hard 1"
        puzzlesVC.puzzle2ButtonTitle = "Hard 2"
        puzzlesVC.puzzle3ButtonTitle = "Hard 3"
        puzzlesVC.puzzle4ButtonTitle = "Hard 4"
        puzzlesVC.puzzle5ButtonTitle = "Hard 5"
        puzzlesVC.bgColor = UIColor.orange
        
        navigationController?.pushViewController(puzzlesVC, animated: true)
    }
    
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

