//
//  HabitView.swift
//  Habit Tracker
//
//  Created by Güray Gül on 7.12.2023.
//

import SwiftUI

struct HabitView: View {
    var data: Habits
    var habit: HabitItem
    
    var body: some View {
        List {
            if habit.detail.isEmpty == false {
                Section {
                    Text(habit.detail)
                }
            }
            
            Section {
                Text("Completion count: \(habit.habitCount)")
                
                Button("Mark Completed") {
                    var newActivity = habit
                    newActivity.habitCount += 1
                    
                    if let index = data.habits.firstIndex(of: habit) {
                        data.habits[index] = newActivity
                    }
                }
            }
        }
        .navigationTitle(habit.name)
    }
}

#Preview {
    HabitView(data: Habits(), habit: .example)
}
