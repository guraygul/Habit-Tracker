//
//  HabitItem.swift
//  Habit Tracker
//
//  Created by Güray Gül on 5.12.2023.
//

import Foundation

struct HabitItem: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    let name: String
    let detail: String
    let habitCount: Int
}
