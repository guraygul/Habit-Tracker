//
//  AddView.swift
//  Habit Tracker
//
//  Created by Güray Gül on 5.12.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    var data : Habits
    
    @State private var name = ""
    @State private var detail = ""

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
                        let trimmedTitle = name.trimmingCharacters(in: .whitespaces)
                        guard trimmedTitle.isEmpty == false else { return }
                        
                        let item  = HabitItem(name: trimmedTitle, detail: detail)
                        data.habits.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView(data: Habits())
}
