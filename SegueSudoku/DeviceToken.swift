//
//  DeviceTokens.swift
//  SegueSudoku
//
//  Created by Phanindra purighalla on 09/08/17.
//  Copyright © 2017 Aarna Solutions Inc. All rights reserved.
//

import AWSDynamoDB

class DeviceToken : AWSDynamoDBObjectModel, AWSDynamoDBModeling  {
    var DeviceID:String = ""
    var DeviceToken:String = ""
    var UserType:String = ""
    
    class func dynamoDBTableName() -> String {
        return "DeviceTokens"
    }
    
    class func hashKeyAttribute() -> String {
        return "DeviceID"
    }
    
}
