//
//  HabitItem.swift
//  HabitTracker
//
//  Created by Juliette Rapala on 11/11/20.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let name: String
}
