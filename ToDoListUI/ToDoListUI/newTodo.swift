//
//  newTodo.swift
//  ToDoListUI
//
//  Created by David Santiago Jamaica Galvis on 5/8/25.
//
import SwiftUI

struct NewTodoView: View {
    @State private var todoTitle = ""
    var onSave: (String) -> Void

    var body: some View {
        NavigationStack {
            Form {
                TextField("Todo Title", text: $todoTitle)
            }
            .navigationTitle("New Todo")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if !todoTitle.isEmpty {
                            onSave(todoTitle)
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onSave("") // dismiss
                    }
                }
            }
        }
    }
}

