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
    
    var sudokuEasy1 = [["2","7"," "," "," ","8","3"," "," "],
                       [" "," "," ","7"," "," "," ","8"," "],
                       [" "," "," "," "," "," "," ","5","1"],
                       ["7"," "," ","6"," ","1"," ","9","5"],
                       ["8"," "," ","4","2","3"," "," ","7"],
                       ["1","4"," ","5"," ","7"," "," ","8"],
                       ["9","1"," "," "," "," "," "," "," "],
                       [" ","6"," "," "," ","5"," "," "," "],
                       [" "," ","3","8"," "," "," ","1","9"]]
    
    var sudokuEasy1SolvedMatrix = [["2","7","9","1","5","8","3","4","6"],
                        ["3","5","1","7","4","6","9","8","2"],
                        ["6","8","4","2","3","9","7","5","1"],
                        ["7","3","2","6","8","1","4","9","5"],
                        ["8","9","5","4","2","3","1","6","7"],
                        ["1","4","6","5","9","7","2","3","8"],
                        ["9","1","8","3","6","2","5","7","4"],
                        ["4","6","7","9","1","5","8","2","3"],
                        ["5","2","3","8","7","4","6","1","9"]]
    
    var sudokuEasy2 = [["9"," ","5"," "," ","6","7"," ","1"],
                       [" "," "," "," "," "," ","9","6"," "],
                       ["2","7"," "," "," ","9","5"," "," "],
                       ["8"," "," ","6","2"," "," "," "," "],
                       [" ","5"," "," "," "," "," ","1"," "],
                       [" "," "," "," ","3","1"," "," ","6"],
                       [" "," ","8","1"," "," "," ","2","5"],
                       [" ","6","7"," "," "," "," "," "," "],
                       ["1"," ","4","8"," "," ","6"," ","3"]]
    
    var sudokuEasy2SolvedMatrix = [["9","3","5","2","8","6","7","4","1"],
                                   ["4","8","1","7","5","3","9","6","2"],
                                   ["2","7","6","4","1","9","5","3","8"],
                                   ["8","1","9","6","2","4","3","5","7"],
                                   ["6","5","3","9","7","8","2","1","4"],
                                   ["7","4","2","5","3","1","8","9","6"],
                                   ["3","9","8","1","6","7","4","2","5"],
                                   ["5","6","7","3","4","2","1","8","9"],
                                   ["1","2","4","8","9","5","6","7","3"]]
    
    var sudokuEasy3 = [[" "," "," "," "," ","3"," ","1"," "],
                       [" ","2","7","4"," "," ","5"," ","8"],
                       [" "," ","8"," "," "," "," "," ","6"],
                       [" "," "," ","3"," ","4"," ","7","2"],
                       ["7","3"," "," "," "," "," ","9","5"],
                       ["4","6"," ","7"," ","2"," "," "," "],
                       ["5"," "," "," "," "," ","2"," "," "],
                       ["2"," ","9"," "," ","7","1","5"," "],
                       [" ","7"," ","5"," "," "," "," "," "]]
    
    var sudokuEasy3SolvedMatrix = [["9","5","6","2","8","3","7","1","4"],
                                   ["1","2","7","4","6","9","5","3","8"],
                                   ["3","4","8","1","7","5","9","2","6"],
                                   ["8","9","1","3","5","4","6","7","2"],
                                   ["7","3","2","8","1","6","4","9","5"],
                                   ["4","6","5","7","9","2","3","8","1"],
                                   ["5","1","4","9","3","8","2","6","7"],
                                   ["2","8","9","6","4","7","1","5","3"],
                                   ["6","7","3","5","2","1","8","4","9"]]
    
    var sudokuEasy4 = [[" "," ","8"," "," ","9","6"," ","2"],
                       [" ","9"," "," "," "," "," "," "," "],
                       [" ","2"," ","6"," ","5"," "," ","1"],
                       [" ","6","2"," ","7"," "," ","5"," "],
                       ["7","3"," "," "," "," "," ","6","9"],
                       [" ","5"," "," ","4"," ","8","2"," "],
                       ["2"," "," ","8"," ","3"," ","4"," "],
                       [" "," "," "," "," "," "," ","9"," "],
                       ["3"," ","9","2"," "," ","5"," "," "]]
    
    var sudokuEasy4SolvedMatrix = [["5","7","8","4","1","9","6","3","2"],
                                   ["1","9","6","7","3","2","4","8","5"],
                                   ["4","2","3","6","8","5","9","7","1"],
                                   ["8","6","2","9","7","1","3","5","4"],
                                   ["7","3","4","5","2","8","1","6","9"],
                                   ["9","5","1","3","4","6","8","2","7"],
                                   ["2","1","5","8","9","3","7","4","6"],
                                   ["6","8","7","1","5","4","2","9","3"],
                                   ["3","4","9","2","6","7","5","1","8"]]
    
    var sudokuEasy5 = [["7"," "," ","9"," "," ","4"," "," "],
                       [" ","9"," "," "," ","7"," ","6"," "],
                       [" ","5","3","8"," ","2"," "," "," "],
                       [" "," ","4"," "," ","1","5","2"," "],
                       ["8"," "," "," "," "," "," "," ","4"],
                       [" ","3","7","5"," "," ","8"," "," "],
                       [" "," "," ","1"," ","8","3","4"," "],
                       [" ","8"," ","3"," "," "," ","5"," "],
                       [" "," ","2"," "," ","9"," "," ","1"]]
    
    var sudokuEasy5SolvedMatrix = [["7","2","6","9","1","5","4","3","8"],
                                   ["1","9","8","4","3","7","2","6","5"],
                                   ["4","5","3","8","6","2","1","9","7"],
                                   ["9","6","4","7","8","1","5","2","3"],
                                   ["8","1","5","2","9","3","6","7","4"],
                                   ["2","3","7","5","4","6","8","1","9"],
                                   ["5","7","9","1","2","8","3","4","6"],
                                   ["6","8","1","3","7","4","9","5","2"],
                                   ["3","4","2","6","5","9","7","8","1"]]
    

    @IBOutlet weak var Puzzle1Button: UIButton!
    @IBAction func Puzzle1ButtonPressed(_ sender: UIButton) {
        let sudokuVC = storyboard?.instantiateViewController(withIdentifier: "SudokuViewController") as! SudokuViewController
        
        switch puzzle1ButtonTitle {
            case "Easy 1":
            sudokuVC.originalMatrix = sudokuEasy1
            sudokuVC.matrix = sudokuEasy1
            sudokuVC.solvedMatrix = sudokuEasy1SolvedMatrix
            sudokuVC.puzzleName = "Easy 1"
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
            sudokuVC.puzzleName = "Easy 2"
        default:
            break
        }
        navigationController?.pushViewController(sudokuVC, animated: true)
    }
    
    @IBOutlet weak var Puzzle3Button: UIButton!
    @IBAction func Puzzle3ButtonPressed(_ sender: UIButton) {
        let sudokuVC = storyboard?.instantiateViewController(withIdentifier: "SudokuViewController") as! SudokuViewController
        
        switch puzzle3ButtonTitle {
        case "Easy 3":
            sudokuVC.originalMatrix = sudokuEasy3
            sudokuVC.matrix = sudokuEasy3
            sudokuVC.solvedMatrix = sudokuEasy3SolvedMatrix
            sudokuVC.puzzleName = "Easy 3"
        default:
            break
        }
        navigationController?.pushViewController(sudokuVC, animated: true)
    }
    
    @IBOutlet weak var Puzzle4Button: UIButton!
    @IBAction func Puzzle4ButtonPressed(_ sender: UIButton) {
        let sudokuVC = storyboard?.instantiateViewController(withIdentifier: "SudokuViewController") as! SudokuViewController
        
        switch puzzle4ButtonTitle {
        case "Easy 4":
            sudokuVC.originalMatrix = sudokuEasy4
            sudokuVC.matrix = sudokuEasy4
            sudokuVC.solvedMatrix = sudokuEasy4SolvedMatrix
            sudokuVC.puzzleName = "Easy 4"
        default:
            break
        }
        navigationController?.pushViewController(sudokuVC, animated: true)
    }
    
    @IBOutlet weak var Puzzle5Button: UIButton!
    @IBAction func Puzzle5ButtonPressed(_ sender: UIButton) {
        let sudokuVC = storyboard?.instantiateViewController(withIdentifier: "SudokuViewController") as! SudokuViewController
        
        switch puzzle5ButtonTitle {
        case "Easy 5":
            sudokuVC.originalMatrix = sudokuEasy5
            sudokuVC.matrix = sudokuEasy5
            sudokuVC.solvedMatrix = sudokuEasy5SolvedMatrix
            sudokuVC.puzzleName = "Easy 5"
        default:
            break
        }
        navigationController?.pushViewController(sudokuVC, animated: true)
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
