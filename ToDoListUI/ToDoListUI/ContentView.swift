//
//  ContentView.swift
//  ToDoListUI
//
//  Created by David Santiago Jamaica Galvis on 5/6/25.
//
import SwiftUI

struct ContentView: View {
    @State private var sections: [SectionModel] = [
        SectionModel(title: "General", todos: Todo.dummyTodos)
    ]
    @State private var isPresentingNewSection = false
    @State private var sectionIndexToAddTodo: Int? = nil

    var body: some View {
        NavigationStack {
            List {
                ForEach(sections.indices, id: \.self) { index in
                    Section(header:
                        HStack {
                            Text(sections[index].title)
                            Spacer()
                            Button(action: {
                                sectionIndexToAddTodo = index
                            }) {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.blue)
                            }
                        }
                    ) {
                        ForEach($sections[index].todos) { $todo in
                            ToDoRowView(todo: $todo)
                        }
                        .onDelete { offsets in
                            sections[index].todos.remove(atOffsets: offsets)
                        }
                    }
                }
            }
            .navigationTitle("ToDo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresentingNewSection = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingNewSection) {
                NewSectionView { newTitle in
                    if !newTitle.isEmpty {
                        sections.append(SectionModel(title: newTitle, todos: []))
                    }
                    isPresentingNewSection = false
                }
            }
            .sheet(item: Binding(
                get: {
                    sectionIndexToAddTodo.map { IndexWrapper(index: $0) }
                },
                set: { newValue in
                    sectionIndexToAddTodo = newValue?.index
                }
            )) { indexWrapper in
                NewTodoView { newTitle in
                    if !newTitle.isEmpty {
                        sections[indexWrapper.index].todos.append(Todo(markedComplete: false, title: newTitle))
                    }
                    sectionIndexToAddTodo = nil
                }
            }
        }
    }

    struct IndexWrapper: Identifiable {
        var index: Int
        var id: Int { index }
    }
}
struct NewSectionView: View {
    @State private var title = ""
    var onSave: (String) -> Void

    var body: some View {
        NavigationStack {
            Form {
                TextField("Section Title", text: $title)
            }
            .navigationTitle("New Section")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if !title.isEmpty {
                            onSave(title)
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onSave("") 
                    }
                }
            }
        }
    }
}




#Preview {
    ContentView()
}
