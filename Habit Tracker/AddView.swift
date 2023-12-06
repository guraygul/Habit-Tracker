//
//  AddView.swift
//  Habit Tracker
//
//  Created by Güray Gül on 5.12.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var detail = ""
    @State private var habitCount = 0
    
    var habits : Habits
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Add a new habit", text: $name)
                TextField("Add the details", text: $detail)
            }
            .navigationTitle("Add a new Habit!")
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save") {
                        let item  = HabitItem(name: name, detail: detail, habitCount: habitCount)
                        habits.items.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView(habits: Habits())
}
