//
//  ContentView.swift
//  iExpense(Project 7)
//
//  Created by mac on 23.08.2022.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showAddView = false
    @State private var expenseType = "All"
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.bold)]
        }
    var body: some View {
        NavigationView {
            ExpenseSection(type: expenseType, sortOrder: sortOrder)
            .navigationTitle("Your expensess:")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                Button{
                     showAddView = true
                }
            label: {
                Image(systemName: "plus")
                    .foregroundColor(Color("Color-1"))
                    
            }
                
                Menu() {
                    Picker("Sort By", selection: $sortOrder) {
                        Text("Name (A-Z)")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount),
                            ])

                        Text("Name (Z-A)")
                            .tag([
                                SortDescriptor(\ExpenseItem.name, order: .reverse),
                                SortDescriptor(\ExpenseItem.amount),
                            ])

                        Text("Amount (Cheapest First)")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])

                        Text("Amount (Most Expensive First)")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }   label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundColor(Color("Color-1"))
                        .frame(width: 0)
                }
                Menu() {
                    Picker("Filter", selection: $expenseType) {
                        Text("Show All Expenses")
                            .tag("All")

                        Divider()

                        ForEach(AddView.types, id: \.self) { type in
                            Text(type)
                                .tag(type)
                        }
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .foregroundColor(Color("Color-1"))
                        .frame(width: 30)
                }

            }
            .sheet(isPresented: $showAddView) {
                AddView()
            }
        }
    }
  
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
