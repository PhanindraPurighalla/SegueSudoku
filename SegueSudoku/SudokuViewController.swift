//
//  SudokuViewController.swift
//  SegueSudoku
//
//  Created by Phanindra purighalla on 29/07/17.
//  Copyright © 2017 Aarna Solutions Inc. All rights reserved.
//

import UIKit

class SudokuViewController: UIViewController {
    
    var requestedRowNumber = 0
    var requestedColNumber = 0
    var selectedSymbol = " "
    var puzzleName = "Puzzle"
    
    var originalMatrix = [[" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "]]
    
    var matrix = [[" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "]]
    
    var solvedMatrix = [[" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "],
                          [" "," "," "," "," "," "," "," "," "]]
    
    var colArray = [[" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "]]
    
    var rowArray = [[" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "," "]]
    
    var block1 = [[" "," "," "],[" "," "," "],[" "," "," "]]
    var block2 = [[" "," "," "],[" "," "," "],[" "," "," "]]
    var block3 = [[" "," "," "],[" "," "," "],[" "," "," "]]
    var block4 = [[" "," "," "],[" "," "," "],[" "," "," "]]
    var block5 = [[" "," "," "],[" "," "," "],[" "," "," "]]
    var block6 = [[" "," "," "],[" "," "," "],[" "," "," "]]
    var block7 = [[" "," "," "],[" "," "," "],[" "," "," "]]
    var block8 = [[" "," "," "],[" "," "," "],[" "," "," "]]
    var block9 = [[" "," "," "],[" "," "," "],[" "," "," "]]
    
    func generateArrays() {
        for row in 0...8 {
            for col in 0...8 {
                colArray[row][col] = matrix[col][row]
                rowArray[row][col] = matrix[row][col]
                switch row {
                case 0...2:
                    switch col {
                    case 0...2:
                        block1[row][col] = matrix[row][col]
                    case 3...5:
                        block2[row][col-3] = matrix[row][col]
                    case 6...8:
                        block3[row][col-6] = matrix[row][col]
                    default:
                        break
                    }
                case 3...5:
                    switch col {
                    case 0...2:
                        block4[row-3][col] = matrix[row][col]
                    case 3...5:
                        block5[row-3][col-3] = matrix[row][col]
                    case 6...8:
                        block6[row-3][col-6] = matrix[row][col]
                    default:
                        break
                    }
                case 6...8:
                    switch col {
                    case 0...2:
                        block7[row-6][col] = matrix[row][col]
                    case 3...5:
                        block8[row-6][col-3] = matrix[row][col]
                    case 6...8:
                        block9[row-6][col-6] = matrix[row][col]
                    default:
                        break
                    }
                default:
                    break
                }
            }
        }
    }
    
    func setBackgroundColor() {
        for row in 0...8 {
            for col in 0...8 {
                if let currentCell = view.subviews[0].subviews[row].subviews[col] as? UIButton {
                    switch row {
                    case 0...2:
                        switch col {
                        case 0...2:
                            currentCell.backgroundColor = UIColor.lightGray
                        case 3...5:
                            currentCell.backgroundColor = UIColor.darkGray
                        case 6...8:
                            currentCell.backgroundColor = UIColor.lightGray
                        default:
                            break
                        }
                    case 3...5:
                        switch col {
                        case 0...2:
                            currentCell.backgroundColor = UIColor.darkGray
                        case 3...5:
                            currentCell.backgroundColor = UIColor.lightGray
                        case 6...8:
                            currentCell.backgroundColor = UIColor.darkGray
                        default:
                            break
                        }
                    case 6...8:
                        switch col {
                        case 0...2:
                            currentCell.backgroundColor = UIColor.lightGray
                        case 3...5:
                            currentCell.backgroundColor = UIColor.darkGray
                        case 6...8:
                            currentCell.backgroundColor = UIColor.lightGray
                        default:
                            break
                        }
                    default:
                        break
                    }
                }
            }
        }
    }
    
    func populateInitialState() {
        
        for row in 0...8 {
            for col in 0...8 {
                matrix[row][col] = originalMatrix[row][col]
                if let currentCell = view.subviews[0].subviews[row].subviews[col] as? UIButton {
                    currentCell.setTitle(originalMatrix[row][col], for: .normal)
                    currentCell.setTitleColor(UIColor.white, for: .normal)
                    if originalMatrix[row][col] == " " {
                        currentCell.isEnabled = true
                    }
                    else {
                        currentCell.isEnabled = false
                        currentCell.setTitleColor(UIColor.black, for: .normal)
                    }
                }
            }
        }
        
        generateArrays()
        
        setBackgroundColor()
    }
    
    func validateMatrix() {
        
        guard isPuzzleComplete() else {
            let alert = UIAlertController(title: "Incomplete puzzle", message: "Please complete all cells", preferredStyle: UIAlertControllerStyle.alert)
            let incompletePuzzleAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (alert: UIAlertAction!) -> Void in
                // The puzzle is not complete yet
            }
            
            alert.addAction(incompletePuzzleAction)
            
            self.present(alert, animated: true, completion:nil)
            
            return
        }
        
        for row in 0...8 {
            for col in 0...8 {
                if let currentCell = view.subviews[0].subviews[row].subviews[col] as? UIButton {
                    
                    if currentCell.title(for: .normal) == solvedMatrix[row][col] {
                        if currentCell.isEnabled == true {
                        currentCell.setTitleColor(UIColor.green, for: .normal)
                        }
                        else {
                            currentCell.setTitleColor(UIColor.black, for: .normal)
                        }
                    }
                    else {
                        if currentCell.title(for: .normal) != " " {
                            currentCell.setTitleColor(UIColor.red, for: .normal)
                        }
                    }
                    
                }
            }
        }
        
    }
    
    func isPuzzleComplete() -> Bool {
        for row in 0...8 {
            for col in 0...8 {
                if let currentCell = view.subviews[0].subviews[row].subviews[col] as? UIButton {
                        if currentCell.title(for: .normal) == " " {
                           return false
                    }
                }
            }
        }
        return true
    }
    
    
    @IBOutlet weak var MainMenu: UIButton!
    
    
    @IBAction func MainMenuPressed(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var Restart: UIButton!
    
    @IBAction func RestartPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Restart puzzle", message: "Are you sure you want to restart the puzzle?", preferredStyle: UIAlertControllerStyle.alert)
        let restartAction = UIAlertAction(title: "Restart", style: UIAlertActionStyle.destructive) { (alert: UIAlertAction!) -> Void in
            self.populateInitialState()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (alert: UIAlertAction!) -> Void in
            //print("You pressed Cancel")
        }
        
        alert.addAction(restartAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion:nil)
        
        
    }
    
    @IBOutlet weak var Validate: UIButton!
    
    
    @IBAction func ValidatePressed(_ sender: UIButton) {
        
        validateMatrix()
    }
    
    @IBOutlet weak var PuzzleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateInitialState()
        
        PuzzleLabel.text = puzzleName
        
        navigationItem.hidesBackButton = true
    }
   
    @IBOutlet weak var ShowHints: UIButton!
    
    
    @IBAction func ShowHintsPressed(_ sender: UIButton) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var SudokuCell: [UIButton]!

    @IBAction func SudokuCellPressed(_ sender: UIButton) {
        let symbolsVC = storyboard?.instantiateViewController(withIdentifier: "SymbolsViewController") as! SymbolsViewController
        
        outer: for row in 0...8 {
            for col in 0...8 {
                if sender == view.subviews[0].subviews[row].subviews[col] as? UIButton {
                    symbolsVC.rowNumber = row
                    symbolsVC.colNumber = col
                    symbolsVC.valueSelected = sender.title(for: .normal)!
                    break outer
                }
            }
        }
        
        requestedRowNumber = symbolsVC.rowNumber
        requestedColNumber = symbolsVC.colNumber
        
        highlightSelectedCell(colorToSet: UIColor.white)
        
        //navigationController?.pushViewController(symbolsVC, animated: true)
        symbolsVC.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        self.present(symbolsVC, animated: true, completion: nil)
    }
    
    func highlightSelectedCell (colorToSet: UIColor) {
        if let selectedCell = view.subviews[0].subviews[requestedRowNumber].subviews[requestedColNumber] as? UIButton {
            selectedCell.setTitleColor(colorToSet, for: .normal)
        }
    }
    
    func writeIntoSelectedCell (symbolToWrite: String) {
        if let selectedCell = view.subviews[0].subviews[requestedRowNumber].subviews[requestedColNumber] as? UIButton {
            selectedCell.setTitle(symbolToWrite, for: .normal)
        }
    }
    
    @IBAction func unwindToSudokuView(unwindSegue: UIStoryboardSegue) {
        writeIntoSelectedCell(symbolToWrite: selectedSymbol)
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
