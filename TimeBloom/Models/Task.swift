import Foundation
import SwiftData

@Model
final class Task {
    var title: String
    var desc: String
    var duration: TimeInterval
    var timeSpent: TimeInterval
    var isCompleted: Bool
    var plantStage: Int
    var createdAt: Date
    var startedAt: Date?
    var completedAt: Date?
    
    @Relationship(deleteRule: .cascade) var subtasks: [SubTask]
    @Relationship(inverse: \Category.tasks) var category: Category?
    
    init(
        title: String,
        desc: String = "",
        duration: TimeInterval,
        timeSpent: TimeInterval = 0,
        isCompleted: Bool = false,
        plantStage: Int = 0
    ) {
        self.title = title
        self.desc = desc
        self.duration = duration
        self.timeSpent = timeSpent
        self.isCompleted = isCompleted
        self.plantStage = plantStage
        self.createdAt = Date()
        self.subtasks = []
    }
    
    var progress: Double {
        return timeSpent / duration
    }
}

