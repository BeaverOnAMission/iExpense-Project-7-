//
//  iExpense_Project_7_App.swift
//  iExpense(Project 7)
//
//  Created by mac on 23.08.2022.
//

import SwiftUI

@main
struct iExpense_Project_7_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
