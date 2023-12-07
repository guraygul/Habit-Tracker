//
//  Habits.swift
//  Habit Tracker
//
//  Created by Güray Gül on 5.12.2023.
//

import Foundation

@Observable
class Habits {
    var habits = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
    
}
