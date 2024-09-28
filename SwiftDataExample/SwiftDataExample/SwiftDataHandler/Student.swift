//
//  Item.swift
//  SwiftDataExample
//
//  Created by Vidhyapathi on 24/09/24.
//

import Foundation
import SwiftData

@Model
final class Student {
    var id: String
    var createdAt: Date
    var name: String
    var age: Int
    var gender: Bool
    var info: String
    
    init(timestamp: Date, name: String, age: Int, gender: Bool, info: String) {
        self.id = UUID().uuidString
        self.createdAt = timestamp
        self.name = name
        self.age = age
        self.gender = gender
        self.info = info
    }
}
