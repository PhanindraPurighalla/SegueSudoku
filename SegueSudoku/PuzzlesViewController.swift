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
    var easyColor = UIColor(red: 175/255, green: 175/255, blue: 175/255, alpha: 1)
    var mediumColor = UIColor(red: 125/255, green: 125/255, blue: 125/255, alpha: 1)
    var hardColor = UIColor(red: 75/255, green: 75/255, blue: 75/255, alpha: 1)
    var bgColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    
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
    
    var sudokuMedium1 = [["8","6","2","5"," "," "," ","9"," "],
                         ["4"," "," "," "," "," "," "," "," "],
                         [" ","3"," "," ","8"," ","1","6"," "],
                         [" ","9","3"," ","1"," ","4"," "," "],
                         [" "," "," ","7"," ","9"," "," "," "],
                         [" "," ","8"," ","3"," ","6","1"," "],
                         [" ","4","6"," ","5"," "," ","2"," "],
                         [" "," "," "," "," "," "," "," ","1"],
                         [" ","7"," "," "," ","8","9","3","6"]]
    
    var sudokuMedium1SolvedMatrix = [["8","6","2","5","7","1","3","9","4"],
                                     ["4","5","1","3","9","6","8","7","2"],
                                     ["9","3","7","2","8","4","1","6","5"],
                                     ["6","9","3","8","1","2","4","5","7"],
                                     ["5","1","4","7","6","9","2","8","3"],
                                     ["7","2","8","4","3","5","6","1","9"],
                                     ["1","4","6","9","5","3","7","2","8"],
                                     ["3","8","9","6","2","7","5","4","1"],
                                     ["2","7","5","1","4","8","9","3","6"]]
    
    var sudokuMedium2 = [[" "," ","8","6","4"," ","9","1","3"],
                         [" "," "," "," "," ","3","4"," "," "],
                         [" "," "," "," "," "," "," ","7"," "],
                         ["9"," ","7"," ","6","1"," "," "," "],
                         [" "," "," ","2"," ","4"," "," "," "],
                         [" "," "," ","9","3"," ","7"," ","2"],
                         [" ","8"," "," "," "," "," "," "," "],
                         [" "," ","4","1"," "," "," "," "," "],
                         ["3","9","1"," ","2","8","6"," "," "]]
    
    var sudokuMedium2SolvedMatrix = [["5","7","8","6","4","2","9","1","3"],
                                     ["6","1","9","7","8","3","4","2","5"],
                                     ["4","3","2","5","1","9","8","7","6"],
                                     ["9","2","7","8","6","1","5","3","4"],
                                     ["8","5","3","2","7","4","1","6","9"],
                                     ["1","4","6","9","3","5","7","8","2"],
                                     ["7","8","5","3","9","6","2","4","1"],
                                     ["2","6","4","1","5","7","3","9","8"],
                                     ["3","9","1","4","2","8","6","5","7"]]
    
    var sudokuMedium3 = [[" ","7","2","3"," "," "," "," "," "],
                         [" ","4"," "," "," ","9"," "," ","6"],
                         [" "," "," "," ","5","8"," "," "," "],
                         [" "," ","3"," "," ","6","5"," "," "],
                         ["5","1"," "," "," "," "," ","4","2"],
                         [" "," ","4","2"," "," ","9"," "," "],
                         [" "," "," ","6","3"," "," "," "," "],
                         ["1"," "," ","4"," "," "," ","8"," "],
                         [" "," "," "," "," ","7","1","6"," "]]
    
    var sudokuMedium3SolvedMatrix = [["9","7","2","3","6","4","8","5","1"],
                                     ["8","4","5","1","2","9","3","7","6"],
                                     ["6","3","1","7","5","8","4","2","9"],
                                     ["2","9","3","8","4","6","5","1","7"],
                                     ["5","1","8","9","7","3","6","4","2"],
                                     ["7","6","4","2","1","5","9","3","8"],
                                     ["4","8","7","6","3","1","2","9","5"],
                                     ["1","5","6","4","9","2","7","8","3"],
                                     ["3","2","9","5","8","7","1","6","4"]]
    
    var sudokuMedium4 = [[" "," "," "," ","4","5","6","2"," "],
                         ["7","6"," "," "," ","8"," "," "," "],
                         [" ","5"," "," "," "," "," "," ","9"],
                         [" "," ","1"," "," "," "," ","5"," "],
                         [" "," "," ","8","7","3"," "," "," "],
                         [" ","9"," "," "," "," ","3"," "," "],
                         ["6"," "," "," "," "," "," ","9"," "],
                         [" "," "," ","1"," "," "," ","8","4"],
                         [" ","4","7","2","5"," "," "," "," "]]
    
    var sudokuMedium4SolvedMatrix = [["1","8","9","7","4","5","6","2","3"],
                                     ["7","6","3","9","2","8","4","1","5"],
                                     ["2","5","4","6","3","1","8","7","9"],
                                     ["3","7","1","4","9","6","2","5","8"],
                                     ["5","2","6","8","7","3","9","4","1"],
                                     ["4","9","8","5","1","2","3","6","7"],
                                     ["6","1","5","3","8","4","7","9","2"],
                                     ["9","3","2","1","6","7","5","8","4"],
                                     ["8","4","7","2","5","9","1","3","6"]]
    
    var sudokuMedium5 = [[" "," "," "," ","6"," ","7"," "," "],
                         [" "," "," ","4"," "," "," "," ","1"],
                         ["6","8"," ","5"," "," ","3"," "," "],
                         ["4"," "," "," ","9"," ","8"," "," "],
                         [" ","9","7"," "," "," ","5","1"," "],
                         [" "," ","5"," ","3"," "," "," ","4"],
                         [" "," ","9"," "," ","8"," ","6","2"],
                         ["1"," "," "," "," ","9"," "," "," "],
                         [" "," ","4"," ","5"," "," "," "," "]]
    
    var sudokuMedium5SolvedMatrix = [["5","4","1","9","6","3","7","2","8"],
                                     ["9","7","3","4","8","2","6","5","1"],
                                     ["6","8","2","5","1","7","3","4","9"],
                                     ["4","2","6","1","9","5","8","7","3"],
                                     ["3","9","7","8","2","4","5","1","6"],
                                     ["8","1","5","7","3","6","2","9","4"],
                                     ["7","5","9","3","4","8","1","6","2"],
                                     ["1","6","8","2","7","9","4","3","5"],
                                     ["2","3","4","6","5","1","9","8","7"]]

    
    var sudokuHard1 = [[" "," "," "," "," "," ","7"," "," "],
                       [" ","5"," "," "," ","8"," ","4","9"],
                       [" "," "," ","9"," "," "," ","1","3"],
                       [" ","2"," "," ","6"," ","3"," "," "],
                       ["5"," "," ","4"," ","7"," "," ","6"],
                       [" "," ","1"," ","5"," "," ","7"," "],
                       ["9","4"," "," "," ","6"," "," "," "],
                       ["7","8"," ","2"," "," "," ","5"," "],
                       [" "," ","5"," "," "," "," "," "," "]]
    
    var sudokuHard1SolvedMatrix = [["1","9","4","6","3","5","7","2","8"],
                                   ["2","5","3","1","7","8","6","4","9"],
                                   ["6","7","8","9","4","2","5","1","3"],
                                   ["4","2","7","8","6","1","3","9","5"],
                                   ["5","3","9","4","2","7","1","8","6"],
                                   ["8","6","1","3","5","9","2","7","4"],
                                   ["9","4","2","5","1","6","8","3","7"],
                                   ["7","8","6","2","9","3","4","5","1"],
                                   ["3","1","5","7","8","4","9","6","2"]]
    
    var sudokuHard2 = [["1","5"," ","7","6"," ","8"," "," "],
                       [" "," "," "," "," ","8"," "," "," "],
                       [" "," "," ","2"," "," ","1"," ","6"],
                       [" "," "," "," "," "," ","2"," ","9"],
                       [" ","6"," "," "," "," "," ","1"," "],
                       ["4"," ","8"," "," "," "," "," "," "],
                       ["3"," ","5"," "," ","4"," "," "," "],
                       [" "," "," ","9"," "," "," "," "," "],
                       [" "," ","2"," ","8","6"," ","5","7"]]
    
    var sudokuHard2SolvedMatrix = [["1","5","3","7","6","9","8","4","2"],
                                   ["2","9","6","4","1","8","7","3","5"],
                                   ["8","4","7","2","5","3","1","9","6"],
                                   ["5","3","1","6","4","7","2","8","9"],
                                   ["7","6","9","8","3","2","5","1","4"],
                                   ["4","2","8","5","9","1","6","7","3"],
                                   ["3","7","5","1","2","4","9","6","8"],
                                   ["6","8","4","9","7","5","3","2","1"],
                                   ["9","1","2","3","8","6","4","5","7"]]
    
    var sudokuHard3 = [[" "," "," "," "," "," "," ","8","9"],
                       ["7"," ","5"," ","6"," "," "," "," "],
                       ["2"," "," ","1"," "," "," ","5"," "],
                       [" ","5"," ","6"," ","1","4"," "," "],
                       [" "," ","3","7"," ","8","2"," "," "],
                       [" "," ","8","4"," ","3"," ","6"," "],
                       [" ","7"," "," "," ","6"," "," ","4"],
                       [" "," "," "," ","4"," ","8"," ","3"],
                       ["3","4"," "," "," "," "," "," "," "]]
    
    var sudokuHard3SolvedMatrix = [["6","1","4","5","7","2","3","8","9"],
                                   ["7","8","5","3","6","9","1","4","2"],
                                   ["2","3","9","1","8","4","6","5","7"],
                                   ["9","5","7","6","2","1","4","3","8"],
                                   ["4","6","3","7","5","8","2","9","1"],
                                   ["1","2","8","4","9","3","7","6","5"],
                                   ["8","7","1","9","3","6","5","2","4"],
                                   ["5","9","6","2","4","7","8","1","3"],
                                   ["3","4","2","8","1","5","9","7","6"]]
    
    var sudokuHard4 = [[" "," "," "," "," "," ","6","7","2"],
                       [" ","9"," ","2"," "," "," "," ","5"],
                       [" "," "," "," "," ","1"," ","4"," "],
                       [" ","6"," ","3"," "," "," "," ","8"],
                       [" "," ","9","5"," ","4","3"," "," "],
                       ["1"," "," "," "," ","2"," ","9"," "],
                       [" ","8"," ","1"," "," "," "," "," "],
                       ["3"," "," "," "," ","9"," ","6"," "],
                       ["9","5","2"," "," "," "," "," "," "]]
    
    var sudokuHard4SolvedMatrix = [["5","4","1","9","3","8","6","7","2"],
                                   ["7","9","3","2","4","6","8","1","5"],
                                   ["6","2","8","7","5","1","9","4","3"],
                                   ["2","6","4","3","9","7","1","5","8"],
                                   ["8","7","9","5","1","4","3","2","6"],
                                   ["1","3","5","6","8","2","4","9","7"],
                                   ["4","8","6","1","7","5","2","3","9"],
                                   ["3","1","7","8","2","9","5","6","4"],
                                   ["9","5","2","4","6","3","7","8","1"]]
    
    var sudokuHard5 = [[" "," "," "," "," "," "," ","4"," "],
                       [" "," "," ","5","6"," "," "," ","3"],
                       [" "," ","5"," ","9","2","1"," ","6"],
                       [" ","1"," "," "," "," ","6"," ","4"],
                       ["7"," ","4"," ","3"," ","9"," ","8"],
                       ["3"," ","9"," "," "," "," ","1"," "],
                       ["9"," ","6","1","7"," ","4"," "," "],
                       ["1"," "," "," ","2","3"," "," "," "],
                       [" ","4"," "," "," "," "," "," "," "]]
    
    var sudokuHard5SolvedMatrix = [["6","9","3","8","1","7","5","4","2"],
                                   ["8","2","1","5","6","4","7","9","3"],
                                   ["4","7","5","3","9","2","1","8","6"],
                                   ["5","1","2","7","8","9","6","3","4"],
                                   ["7","6","4","2","3","1","9","5","8"],
                                   ["3","8","9","6","4","5","2","1","7"],
                                   ["9","3","6","1","7","8","4","2","5"],
                                   ["1","5","7","4","2","3","8","6","9"],
                                   ["2","4","8","9","5","6","3","7","1"]]

    

    @IBOutlet weak var Puzzle1Button: UIButton!
    @IBAction func Puzzle1ButtonPressed(_ sender: UIButton) {
        let sudokuVC = storyboard?.instantiateViewController(withIdentifier: "SudokuViewController") as! SudokuViewController
        
        switch puzzle1ButtonTitle {
        case "Easy 1":
            sudokuVC.originalMatrix = sudokuEasy1
            sudokuVC.matrix = sudokuEasy1
            sudokuVC.solvedMatrix = sudokuEasy1SolvedMatrix
            sudokuVC.puzzleName = "Easy 1"
            sudokuVC.bgColor = easyColor
        case "Medium 1":
            sudokuVC.originalMatrix = sudokuMedium1
            sudokuVC.matrix = sudokuMedium1
            sudokuVC.solvedMatrix = sudokuMedium1SolvedMatrix
            sudokuVC.puzzleName = "Medium 1"
            sudokuVC.bgColor = mediumColor
        case "Hard 1":
            sudokuVC.originalMatrix = sudokuHard1
            sudokuVC.matrix = sudokuHard1
            sudokuVC.solvedMatrix = sudokuHard1SolvedMatrix
            sudokuVC.puzzleName = "Hard 1"
            sudokuVC.bgColor = hardColor
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
            sudokuVC.bgColor = easyColor
        case "Medium 2":
            sudokuVC.originalMatrix = sudokuMedium2
            sudokuVC.matrix = sudokuMedium2
            sudokuVC.solvedMatrix = sudokuMedium2SolvedMatrix
            sudokuVC.puzzleName = "Medium 2"
            sudokuVC.bgColor = mediumColor
        case "Hard 2":
            sudokuVC.originalMatrix = sudokuHard2
            sudokuVC.matrix = sudokuHard2
            sudokuVC.solvedMatrix = sudokuHard2SolvedMatrix
            sudokuVC.puzzleName = "Hard 2"
            sudokuVC.bgColor = hardColor
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
            sudokuVC.bgColor = easyColor
        case "Medium 3":
            sudokuVC.originalMatrix = sudokuMedium3
            sudokuVC.matrix = sudokuMedium3
            sudokuVC.solvedMatrix = sudokuMedium3SolvedMatrix
            sudokuVC.puzzleName = "Medium 3"
            sudokuVC.bgColor = mediumColor
        case "Hard 3":
            sudokuVC.originalMatrix = sudokuHard3
            sudokuVC.matrix = sudokuHard3
            sudokuVC.solvedMatrix = sudokuHard3SolvedMatrix
            sudokuVC.puzzleName = "Hard 3"
            sudokuVC.bgColor = hardColor
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
            sudokuVC.bgColor = easyColor
        case "Medium 4":
            sudokuVC.originalMatrix = sudokuMedium4
            sudokuVC.matrix = sudokuMedium4
            sudokuVC.solvedMatrix = sudokuMedium4SolvedMatrix
            sudokuVC.puzzleName = "Medium 4"
            sudokuVC.bgColor = mediumColor
        case "Hard 4":
            sudokuVC.originalMatrix = sudokuHard4
            sudokuVC.matrix = sudokuHard4
            sudokuVC.solvedMatrix = sudokuHard4SolvedMatrix
            sudokuVC.puzzleName = "Hard 4"
            sudokuVC.bgColor = hardColor
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
            sudokuVC.bgColor = easyColor
        case "Medium 5":
            sudokuVC.originalMatrix = sudokuMedium5
            sudokuVC.matrix = sudokuMedium5
            sudokuVC.solvedMatrix = sudokuMedium5SolvedMatrix
            sudokuVC.puzzleName = "Medium 5"
            sudokuVC.bgColor = mediumColor
        case "Hard 5":
            sudokuVC.originalMatrix = sudokuHard5
            sudokuVC.matrix = sudokuHard5
            sudokuVC.solvedMatrix = sudokuHard5SolvedMatrix
            sudokuVC.puzzleName = "Hard 5"
            sudokuVC.bgColor = hardColor
        default:
            break
        }
        navigationController?.pushViewController(sudokuVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = bgColor
        
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
