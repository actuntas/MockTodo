//
//  ToDoRepository.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation



class MockToDoRepository: ToDoRepository {
    private var toDos = [
        ToDo(isCompleted: false, title: "Learn more about Web3"),
        ToDo(isCompleted: false, title: "Build an iOS App with Kotlin Multiplatform"),
        ToDo(isCompleted: true, title: "Walk the dogs")
    ]
    
    func fetchToDos() -> [ToDo] {
        return toDos
    }
    
    func addToDo(_ todo: ToDo) {
        toDos.append(todo)
    }
    
    func removeToDo(_ index: Int) {
        toDos.remove(at: index)
    }
}
