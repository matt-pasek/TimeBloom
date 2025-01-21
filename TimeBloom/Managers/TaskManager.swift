import Foundation
import SwiftData

@Observable
class TaskManager {
    private var modelContext: ModelContext
    private var timer: Timer?
    
    var activeTask: Task?
    var isTimerRunning = false
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func startTask(_ task: Task) {
        activeTask = task
        isTimerRunning = true
        task.startedAt = Date()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateActiveTask()
        }
    }
    
    func pauseTask() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
    }
    
    func completeTask(_ task: Task) {
        task.isCompleted = true
        task.completedAt = Date()
        try? modelContext.save()
    }
    
    private func updateActiveTask() {
        guard let task = activeTask else { return }
        task.timeSpent += 1
        
        let newStage = Int(min(4, floor(task.progress * 5)))
        if newStage != task.plantStage {
            task.plantStage = newStage
        }
        
        if task.timeSpent >= task.duration {
            completeTask(task)
            pauseTask()
        }
        
        try? modelContext.save()
    }
}
