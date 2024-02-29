//
//  ExpenseItem.swift
//  iExpense(Project 7)
//
//  Created by mac on 25.08.2022.
//
import SwiftData
import Foundation
@Model
class ExpenseItem {
    let name: String
    let type : String
    let amount: Double
    
    init(name:String, type: String, amount: Double) {
        self.name = name
        self.amount = amount
        self.type = type
    }
    
}

