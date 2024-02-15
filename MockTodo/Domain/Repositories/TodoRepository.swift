//
//  TodoRepository.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

protocol ToDoRepository {
    func fetchToDos() -> [ToDo]
    func addToDo(_ todo: ToDo)
    func removeToDo(_ index: Int)
}
