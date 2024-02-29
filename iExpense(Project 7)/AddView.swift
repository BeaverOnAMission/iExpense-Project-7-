//
//  AddView.swift
//  iExpense(Project 7)
//
//  Created by mac on 25.08.2022.
//


import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    static let types = ["Business", "Personal"]
    let locale = Locale.current
   
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach (Self.types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .toolbar{
                Button ("save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    modelContext.insert(item)
                    dismiss()
                }.foregroundColor(.white)
                    .font(.title3)
            }
        }
    }
}

  
