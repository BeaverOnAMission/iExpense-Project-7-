//
//  ExpenseSection.swift
//  iExpense(Project 7)
//
//  Created by mac on 03.12.2023.
//
import SwiftData
import SwiftUI

struct ExpenseSection: View {
    @Environment(\.modelContext) var modelContext
    @Query private var expenses: [ExpenseItem]

    var body: some View {
       List {
            ForEach(expenses) {item in
                HStack{
                    VStack{
                        Text(item.name)
                            .font(.title2).bold()
                            .style(for: item)
                        Text(item.type)
                            .font(.body)
                            .style(for: item)
                    }
                    Spacer()
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .fontWeight(.bold)
                        .style(for: item)
                     
                }
            }
            .onDelete(perform: removeItems)
        }
    } 
    
    init(type: String = "All", sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate {
            if type == "All" {
                return true
            } else {
                return $0.type == type
            }
        }, sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {

        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
            }
        }
    }




