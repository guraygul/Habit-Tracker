//
//  Habits.swift
//  Habit Tracker
//
//  Created by Güray Gül on 5.12.2023.
//

import Foundation

@Observable
class Habits {
    var items = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
    
}
