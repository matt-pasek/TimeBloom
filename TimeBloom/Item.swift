//
//  Item.swift
//  TimeBloom
//
//  Created by Mateusz Pasek on 21/01/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
