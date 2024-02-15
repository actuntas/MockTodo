//
//  ToDoListView.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

struct ToDoListView: View {
    @ObservedObject var viewModel: ToDoViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.sortedToDos) { todo in
                VStack(alignment: .center, spacing: 8) {
                    HStack(alignment: .center) {
                        Button {
                            viewModel.check(todo)
                        } label: {
                            Image(systemName: todo.isCompleted ? "circle.fill" : "circle").font(.system(size: 12)).foregroundColor(.primary)

                        }

                        Text(todo.title).font(.caption)
                            .strikethrough(todo.isCompleted, pattern: .solid, color: .primary)
                        Spacer()
                    }
                }
                
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    viewModel.removeToDo(index)

                }
            })
            .listStyle(.insetGrouped).listRowSpacing(3)
        }.sheet(isPresented: $viewModel.addNew, content: {
            CreateToDoView(onAdd: onAdd(_:))
        })
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {viewModel.addNew.toggle()}, label: {
                    Image(systemName: "plus.circle")
                })
            }
        })
    }
    
    private func onAdd(_ todo: ToDo) {
        viewModel.addToDo(todo)
    }
}
