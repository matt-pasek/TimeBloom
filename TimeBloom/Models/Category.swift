import Foundation
import SwiftData

@Model
final class Category {
    var name: String
    var colorHex: String
    var createdAt: Date
    
    @Relationship(deleteRule: .cascade) var tasks: [Task]
    
    init(name: String, colorHex: String = "#FF0000") {
        self.name = name
        self.colorHex = colorHex
        self.createdAt = Date()
        self.tasks = []
    }
}
