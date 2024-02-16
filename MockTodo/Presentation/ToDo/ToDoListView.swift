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
        VStack {
            // Display a message if there are no tasks.
            if viewModel.toDos.isEmpty {
                ContentUnavailableView(Constants.noTask, systemImage: Constants.bookIcon)
                    .offset(y: -UIScreen.main.bounds.width / 6)
                
            } else {
                // Display the list of tasks.
                List {
                    ForEach(viewModel.sortedToDos) { todo in
                        ToDoRow(todo: todo, checkAction: {
                            viewModel.check(todo)
                        })
                    }
                    .onDelete(perform: removeToDo)
                    .listStyle(.insetGrouped)
                    .listRowSpacing(3)
                }
            }
        }
        // Present the view for creating a new To-Do.
        .sheet(isPresented: $viewModel.addNew, content: {
            CreateToDoView(onAdd: onAdd(_:))
        })
        // Toolbar button to add a new To-Do.
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                addButton
            }
        }
    }
    
    // View for the add button in the navigation bar.
    private var addButton: some View {
        Button(action: viewModel.newToDo) {
            Image(systemName: Constants.plusIcon)
        }
    }
    
    private func onAdd(_ todo: ToDo) {
        viewModel.addToDo(todo)
    }
    
    private func removeToDo(at offsets: IndexSet) {
        offsets.forEach(viewModel.removeToDo)
    }
    
    private enum Constants {
        static let plusIcon = "plus.circle"
        static let bookIcon = "book.fill"
        static let noTask = "You have no tasks yet..."
    }
}

// Subview representing a single row in the To-Do list.
private struct ToDoRow: View {
    let todo: ToDo
    let checkAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Button(action: checkAction) {
                    Image(systemName: todo.isCompleted ? Constants.filledCircleIcon : Constants.circleIcon)
                        .font(.system(size: 12))
                        .foregroundColor(.primary)
                }
                
                Text(todo.title)
                    .font(.caption)
                    .strikethrough(todo.isCompleted, pattern: .solid, color: .primary)
                Spacer()
            }
        }
    }
    
    private enum Constants {
        static let filledCircleIcon = "circle.fill"
        static let circleIcon = "circle"
    }
}
