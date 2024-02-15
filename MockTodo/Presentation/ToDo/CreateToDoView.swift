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
                TextField("Task Title", text: $title)
                Button("Create") {
                    let newTask = ToDo(title: title)
                    onAdd(newTask)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(title.isEmpty)
                .navigationTitle("Add Task")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CreateToDoView(onAdd: {_ in})
}
