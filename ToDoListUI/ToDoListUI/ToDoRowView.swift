//
//  ToDoRowView.swift
//  ToDoListUI
//
//  Created by David Santiago Jamaica Galvis on 5/6/25.
//

import SwiftUI

struct ToDoRowView : View {
    
    @Binding var todo: Todo
    
    var body : some View {
        HStack {
                    Button {
                        todo.markedComplete.toggle()
                    } label: {
                        Circle().strokeBorder(.blue, lineWidth: 1).background(Circle().fill(todo.markedComplete ? .blue : .clear))
                            .frame(width: 20, height: 20)
                    }
                    Text(todo.title)
                        .padding(.leading, 5)
                    Spacer()
                }
                .padding()
                .frame(height: 40)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var todo = Todo.dummyTodos[0]
    ToDoRowView(todo: $todo)
}
