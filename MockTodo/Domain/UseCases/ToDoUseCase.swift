//
//  ToDoUseCase.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

class ToDoUseCase {
    private let repository: ToDoRepositoryProtocol
    
    init(repository: ToDoRepositoryProtocol) {
        self.repository = repository
    }
    
    func getToDos() -> [ToDo] {
        return repository.fetchToDos()
    }
    
    func addToDo(_ todo: ToDo) {
        repository.addToDo(todo)
    }
    
    func removeToDo(_ index: Int) {
        repository.removeToDo(index)
    }
    
    func checkToDo() {
        
    }
}
