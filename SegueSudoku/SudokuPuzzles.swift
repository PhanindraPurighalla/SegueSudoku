//
//  SudokuPuzzlesDBViewController.swift
//  SegueSudoku
//
//  Created by Phanindra purighalla on 09/08/17.
//  Copyright © 2017 Aarna Solutions Inc. All rights reserved.
//

import AWSDynamoDB

class SudokuPuzzles : AWSDynamoDBObjectModel, AWSDynamoDBModeling  {
    var SudokuPuzzleID:String?
    var DifficultyLevel:String?
    var Matrix:String?
    
    class func dynamoDBTableName() -> String {
        return "SudokuPuzzles"
    }
    
    class func hashKeyAttribute() -> String {
        return "SudokuPuzzleID"
    }

}
