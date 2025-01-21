import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]

    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    Text(task.title)
                }
            }
            .navigationTitle("TimeBloom")
            .toolbar {
                Button("Add task") {
                    let task = Task(title: "Test Task", duration: 1500)
                    modelContext.insert(task)
                }
            }
        }
    }
}
