//
//  ToDo.swift
//  ToDoListUI
//
//  Created by David Santiago Jamaica Galvis on 5/6/25.
//

import SwiftUI

struct Todo: Identifiable {
    let id: UUID = UUID()
    var markedComplete: Bool
    var title : String
}

extension Todo {
    static var dummyTodos: [Todo] = [
        Todo(markedComplete: false, title: "Homework"),
        Todo(markedComplete: true, title: "Code"),
        Todo(markedComplete: true, title: "Sleep"),
        Todo(markedComplete: false, title: "Learn how to collaborate using git"),
        Todo(markedComplete: true, title: "Learn SwiftUI SubViews")
    ]
}
struct SectionModel: Identifiable {
    let id: UUID = UUID()
    var title: String
    var todos: [Todo]
}

