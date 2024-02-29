//
//  Type.swift
//  iExpense(Project 7)
//
//  Created by mac on 02.12.2023.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount<100{
            return self.foregroundColor(Color("Color-0"))
        }
        else if item.amount<1000{
            return self.foregroundColor(Color("Color-1"))
        }
        else {
            return self.foregroundColor(Color("Color-2"))
             }
    }
}
