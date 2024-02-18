//
//  InMemoryToDoRepository.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

final class UserDefaultsToDoRepository: ToDoRepository {
    private let todosKey = "todos"
    
    private var toDos: [ToDo] {
        get {
            return loadToDos()
        }
        set {
            saveToDos(newValue)
        }
    }
    
    func fetchToDos() -> [ToDo] {
        return toDos
    }
    
    func addToDo(_ todo: ToDo) {
        toDos.append(todo)
    }
    
    func removeToDo(_ index: Int) {
        if toDos.indices.contains(index) {
            toDos.remove(at: index)
        }
    }
    
    func updateToDo(_ todo: ToDo) {
        if let index = toDos.firstIndex(where: { $0.id == todo.id }) {
            toDos[index].isCompleted = todo.isCompleted
        }
    }
}

extension UserDefaultsToDoRepository {
    private func saveToDos(_ toDos: [ToDo]) {
        let dtos = toDos.toLocal()
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(dtos) {
            UserDefaults.standard.set(encoded, forKey: todosKey)
        }
    }
    
    private func loadToDos() -> [ToDo] {
        guard let savedToDosData = UserDefaults.standard.data(forKey: todosKey) else { return [] }
        let decoder = JSONDecoder()
        if let savedToDos = try? decoder.decode([ToDoDTO].self, from: savedToDosData) {
            return savedToDos.toDomain()
        }
        return []
    }
}

//MARK: - Mapper
//DTO -> Domain
private extension Array where Element == ToDoDTO {
    func toDomain() -> [ToDo] {
        return map { ToDo(id: $0.id, isCompleted: $0.isCompleted, title: $0.title)}
    }
}

//Domain -> DTO
private extension Array where Element == ToDo {
    func toLocal() -> [ToDoDTO] {
        return map { ToDoDTO(id: $0.id, title: $0.title, isCompleted: $0.isCompleted)}
    }
}
