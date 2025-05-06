//
//  ContentView.swift
//  ToDoListUI
//
//  Created by David Santiago Jamaica Galvis on 5/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var todos = Todo.dummyTodos
    var body: some View {
        VStack {
            //title
            HStack {
                Text("ToDo")
                    .font(.largeTitle)
                Spacer()
            }
            List {
                ForEach($todos) { todo in
                    ToDoRowView(todo: todo)
                }
            }
            .listStyle(.plain)
            Spacer()
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
