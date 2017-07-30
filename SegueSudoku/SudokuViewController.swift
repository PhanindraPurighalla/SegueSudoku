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
    var selectedSymbol = "0"
    
    var originalMatrix = [["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"]]
    
    var matrix = [["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"]]
    
    var solvedMatrix = [["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"],
                          ["0","0","0","0","0","0","0","0","0"]]
    
    var colArray = [["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"]]
    
    var rowArray = [["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"],
                    ["0","0","0","0","0","0","0","0","0"]]
    
    var block1 = [["0","0","0"],["0","0","0"],["0","0","0"]]
    var block2 = [["0","0","0"],["0","0","0"],["0","0","0"]]
    var block3 = [["0","0","0"],["0","0","0"],["0","0","0"]]
    var block4 = [["0","0","0"],["0","0","0"],["0","0","0"]]
    var block5 = [["0","0","0"],["0","0","0"],["0","0","0"]]
    var block6 = [["0","0","0"],["0","0","0"],["0","0","0"]]
    var block7 = [["0","0","0"],["0","0","0"],["0","0","0"]]
    var block8 = [["0","0","0"],["0","0","0"],["0","0","0"]]
    var block9 = [["0","0","0"],["0","0","0"],["0","0","0"]]
    
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
                    if originalMatrix[row][col] == "0" {
                        currentCell.isEnabled = true
                    }
                    else {
                        currentCell.isEnabled = false
                    }
                }
            }
        }
        
        generateArrays()
        
        setBackgroundColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateInitialState()
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
                    break outer
                }
            }
        }
        
        requestedRowNumber = symbolsVC.rowNumber
        requestedColNumber = symbolsVC.colNumber
        
        highlightSelectedCell(colorToSet: UIColor.orange)
        
        //navigationController?.pushViewController(symbolsVC, animated: true)
        symbolsVC.modalPresentationStyle = .overFullScreen
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
            
            switch selectedSymbol {
            case solvedMatrix[requestedRowNumber][requestedColNumber]:
                highlightSelectedCell(colorToSet: UIColor.green)
            case "0":
                highlightSelectedCell(colorToSet: UIColor.orange)
            default:
                highlightSelectedCell(colorToSet: UIColor.red)
            }
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
