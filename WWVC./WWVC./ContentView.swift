//
//  ContentView.swift
//  WWVC.
//
//  Created by David Santiago Jamaica Galvis on 7/17/25.
//

import SwiftUI
import SwiftData

@Model
class Task {
    var id = UUID()
    var title: String
    var isComplete: Bool = false

    init(title: String) {
        self.title = title
    }
}

struct ContentView: View {
    @Query var tasks: [Task]
    @State private var newTaskTitle = ""

 
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $newTaskTitle)
                        .textFieldStyle(.roundedBorder)

                    Button("Add") {
                        addTask()
                    }
                    .disabled(newTaskTitle.isEmpty)
                }
                .padding()

                List {
                    ForEach(tasks, id: \.id) { task in
                        HStack {
                            Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    toggleComplete(task)
                                }
                            Text(task.title)
                        }
                    }
                    .onDelete(perform: deleteTasks)
                }
            }
            .navigationTitle("My Tasks")
        }
    }

    private func addTask() {
        let newTask = Task(title: newTaskTitle)
        modelContext.insert(newTask)
        newTaskTitle = ""
    }

    private func toggleComplete(_ task: Task) {
        task.isComplete.toggle()
    }

    private func deleteTasks(at offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            modelContext.delete(task)
        }
    }
}






#Preview {
    ContentView()
}
