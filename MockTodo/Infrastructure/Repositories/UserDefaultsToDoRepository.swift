//
//  InMemoryToDoRepository.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

class UserDefaultsToDoRepository: ToDoRepository {
    private let todosKey = "todos"
    
    private var toDos: [ToDo] {
        get {
            guard let savedToDosData = UserDefaults.standard.data(forKey: todosKey) else { return [] }
            let decoder = JSONDecoder()
            if let savedToDos = try? decoder.decode([ToDoDTO].self, from: savedToDosData) {
                return savedToDos.map { $0.toDomain() }
            }
            return []
        }
        set {
            let dtos = newValue.map { ToDoDTO.fromDomain($0) }
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(dtos) {
                UserDefaults.standard.set(encoded, forKey: todosKey)
            }
        }
    }
    func fetchToDos() -> [ToDo] {
        return toDos
    }
    
    func addToDo(_ todo: ToDo) {
        var updatedToDos = fetchToDos()
        updatedToDos.append(todo)
        toDos = updatedToDos
    }
    
    func removeToDo(_ index: Int) {
        var updatedToDos = fetchToDos()
        if updatedToDos.indices.contains(index) {
            updatedToDos.remove(at: index)
            toDos = updatedToDos
        }
    }
}
