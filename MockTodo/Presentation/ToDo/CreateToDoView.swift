//
//  CreateTaskView.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

struct CreateToDoView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    var onAdd: (ToDo) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                TextField(Constants.todoTitle, text: $title)
                Button(Constants.create) {
                    let newTask = ToDo(title: title)
                    onAdd(newTask)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(title.isEmpty)
                .navigationTitle(Constants.addTask)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(Constants.cancel) {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
    
    private enum Constants {
        static let cancel = "Cancel"
        static let addTask = "Add Task"
        static let create = "Create"
        static let todoTitle = "ToDo Title"
    }
}

#Preview {
    CreateToDoView(onAdd: {_ in})
}
