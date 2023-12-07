//
//  HabitItem.swift
//  Habit Tracker
//
//  Created by Güray Gül on 5.12.2023.
//

import Foundation

struct HabitItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var detail: String
    var habitCount = 0
    
    static let example = HabitItem(name: "Example habit", detail: "This is a test detail")
}
