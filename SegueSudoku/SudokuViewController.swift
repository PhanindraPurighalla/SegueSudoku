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
    
    var candidatesDictionary = Dictionary<String, [[String]]>()
    
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
            let alert = UIAlertController(title: "Incomplete puzzle", message: "You have not completed the puzzle!", preferredStyle: UIAlertControllerStyle.alert)
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
                        if currentCell.title(for: .normal) == " " || currentCell.titleLabel?.font == UIFont.systemFont(ofSize: 10){
                           return false
                    }
                }
            }
        }
        return true
    }
    
    func checkIfBlockContainsSymbol (block : [[String]], symbolToCheck: String) -> Bool {
        var blockContainsSymbol = false
        for row in 0...2 {
            if block[row].contains(symbolToCheck) {
                blockContainsSymbol = true
                break
            }
        }
        return blockContainsSymbol
    }
    
    func findCandidateCellsAtSpecifiedLocation (emptyCellRow: Int, emptyCellCol: Int) -> [[String]] {
        var candidateValues = [["1","2","3"],["4","5","6"],["7","8","9"]]
        for row in 0...2 {
            for col in 0...2 {
                if rowArray[emptyCellRow].contains(candidateValues[row][col]) || colArray[emptyCellCol].contains(candidateValues[row][col]) {
                    candidateValues[row][col] = " "
                }
                if candidateValues[row][col] == " " {
                    continue
                }
                switch emptyCellRow {
                case 0...2:
                    switch emptyCellCol {
                    case 0...2:
                        if checkIfBlockContainsSymbol(block: block1, symbolToCheck: candidateValues[row][col]) {
                            candidateValues[row][col] = " "
                        }
                    case 3...5:
                        if checkIfBlockContainsSymbol(block: block2, symbolToCheck: candidateValues[row][col]) {
                            candidateValues[row][col] = " "
                        }
                    case 6...8:
                        if checkIfBlockContainsSymbol(block: block3, symbolToCheck: candidateValues[row][col]) {
                            candidateValues[row][col] = " "
                        }
                    default:
                        break
                    }
                case 3...5:
                    switch emptyCellCol {
                    case 0...2:
                        if checkIfBlockContainsSymbol(block: block4, symbolToCheck: candidateValues[row][col]) {
                            candidateValues[row][col] = " "
                        }
                    case 3...5:
                        if checkIfBlockContainsSymbol(block: block5, symbolToCheck: candidateValues[row][col]) {
                            candidateValues[row][col] = " "
                        }
                    case 6...8:
                        if checkIfBlockContainsSymbol(block: block6, symbolToCheck: candidateValues[row][col]) {
                            candidateValues[row][col] = " "
                        }
                    default:
                        break
                    }
                case 6...8:
                    switch emptyCellCol {
                    case 0...2:
                        if checkIfBlockContainsSymbol(block: block7, symbolToCheck: candidateValues[row][col]) {
                            candidateValues[row][col] = " "
                        }
                    case 3...5:
                        if checkIfBlockContainsSymbol(block: block8, symbolToCheck: candidateValues[row][col]) {
                            candidateValues[row][col] = " "
                        }
                    case 6...8:
                        if checkIfBlockContainsSymbol(block: block9, symbolToCheck: candidateValues[row][col]) {
                            candidateValues[row][col] = " "
                        }
                    default:
                        break
                    }
                default:
                    break
                }
            }
        }
        return candidateValues
    }
    
    func calculateCandidateCells () {
        candidatesDictionary.removeAll()
        for row in 0...8 {
            for col in 0...8 {
                if matrix[row][col] == " " {
                    candidatesDictionary[String(row) + String(col)] = findCandidateCellsAtSpecifiedLocation(emptyCellRow: row, emptyCellCol: col)
                }
            }
        }
    }
    
    
    @IBOutlet weak var MainMenu: UIButton!
    
    
    @IBAction func MainMenuPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Go to main menu?", message: "This will erase all progress!", preferredStyle: UIAlertControllerStyle.alert)
        let mainMenuAction = UIAlertAction(title: "Main Menu", style: UIAlertActionStyle.destructive) { (alert: UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "mainMenu", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (alert: UIAlertAction!) -> Void in
            //print("You pressed Cancel")
        }
        
        alert.addAction(mainMenuAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion:nil)
        
        
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
    
    func isProgressValid () -> Bool {
        for row in 0...8 {
            for col in 0...8 {
                if let currentCell = view.subviews[0].subviews[row].subviews[col] as? UIButton {
                    
                    if currentCell.title(for: .normal) != " " && currentCell.titleLabel?.font == UIFont.systemFont(ofSize: 30) && currentCell.title(for: .normal) != solvedMatrix[row][col] {
                        
                            currentCell.setTitleColor(UIColor.red, for: .normal)
                        return false
                    }
                    
                }
            }
        }
        return true
    }
    
    func isInPuzzleMode () -> Bool {
        for row in 0...8 {
            for col in 0...8 {
                if let currentCell = view.subviews[0].subviews[row].subviews[col] as? UIButton {
                    
                    if currentCell.titleLabel?.font == UIFont.systemFont(ofSize: 10) {
                        
                        return false
                    }
                    
                }
            }
        }
        return true
    }
   
    @IBOutlet weak var ShowHints: UIButton!
    
    
    @IBAction func ShowHintsPressed(_ sender: UIButton) {
        
        guard isProgressValid() else {
            let alert = UIAlertController(title: "Invalid cells", message: "One or more cells are invalid! Please correct or clear them!", preferredStyle: UIAlertControllerStyle.alert)
            let invalidProgressAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (alert: UIAlertAction!) -> Void in
                // Invalid cells to be corrected before showing hints
            }
            
            alert.addAction(invalidProgressAction)
            
            self.present(alert, animated: true, completion:nil)
            
            return
        }
        
        calculateCandidateCells()
        for row in 0...8 {
            for col in 0...8 {
                if let cell = view.subviews[0].subviews[row].subviews[col] as? UIButton {
                    
                    if cell.title(for: .normal) == " " {
                    
                        var candidateString = ""
                        for i in 0...2 {
                            for j in 0...2 {
                                candidateString += " " + (candidatesDictionary[String(row)+String(col)]?[i][j])!
                            }
                            candidateString += "\n"
                        }
                    
                        cell.setTitle(candidateString, for: .normal)
                        cell.titleLabel?.font = UIFont.systemFont(ofSize: 10)
                        cell.setTitleColor(UIColor.white, for: .normal)
                    }
                    else if cell.titleLabel?.font == UIFont.systemFont(ofSize: 10) {
                        
                        cell.setTitle(" ", for: .normal)
                        cell.titleLabel?.font = UIFont.systemFont(ofSize: 30)
                        cell.setTitleColor(UIColor.white, for: .normal)
                    }
                }
            }
        }
        
        if isInPuzzleMode() {
            sender.setTitle("Show Hints", for: .normal)
        }
        else {
            sender.setTitle("Clear Hints", for: .normal)
        }
    }
    
    func printCandidates() {
        for rowNum in 0...8 {
            for m in 0...2 {
                var curRow = "";
                for colNum in 0...8 {
                    for j in 0...2 {
                        
                        if let candidateCells = candidatesDictionary[String(rowNum)+String(colNum)] {
                            curRow += " " + (candidateCells[m][j])
                        }
                        
                    }
                    curRow += " |"
                }
                print (curRow)            }
            print("________________________________________________________________________");
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var SudokuCell: [UIButton]!

    @IBAction func SudokuCellPressed(_ sender: UIButton) {
        
        guard isInPuzzleMode() else {
            let alert = UIAlertController(title: "Not editable in hint mode", message: "Please clear hints before progressing!", preferredStyle: UIAlertControllerStyle.alert)
            let inHintModeAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive) { (alert: UIAlertAction!) -> Void in
                // Hints to be cleared before progressing
            }
            
            alert.addAction(inHintModeAction)
            
            self.present(alert, animated: true, completion:nil)
            
            return
        }
        
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
            selectedCell.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            matrix[requestedRowNumber][requestedColNumber] = symbolToWrite
            generateArrays()
            candidatesDictionary.removeValue(forKey: String(requestedRowNumber) + String(requestedColNumber))
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
