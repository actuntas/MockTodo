//
//  ToDoViewModel.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    @Published var addNew: Bool = false
    private var useCase: ToDoUseCase
    
    init(useCase: ToDoUseCase) {
        self.useCase = useCase
        loadToDos()
    }
    
    var sortedToDos: [ToDo] {
        toDos.sorted { !$0.isCompleted && $1.isCompleted }
    }
    
    func loadToDos() {
        toDos = useCase.getToDos()
    }
    
    func addToDo(_ todo: ToDo) {
        useCase.addToDo(todo)
        loadToDos()
    }
    
    func removeToDo(_ index: Int) {
        useCase.removeToDo(index)
        loadToDos()
    }
    
    func check(_ todo: ToDo) {
        if let index = toDos.firstIndex(where: { $0.id == todo.id }) {
            toDos[index].isCompleted.toggle()
            useCase.updateToDo(toDos[index])
        }
    }
    
    func newToDo() { addNew.toggle() }
}
