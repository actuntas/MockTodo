//
//  ToDoDto.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

struct ToDoDTO: Codable {
    var id: UUID
    var title: String
    var isCompleted: Bool

    // Domain to DTO
    func toDomain() -> ToDo {
        return ToDo(id: id, isCompleted: isCompleted, title: title)
    }

    // DTO to Domain
    static func fromDomain(_ todo: ToDo) -> ToDoDTO {
        return ToDoDTO(id: todo.id, title: todo.title, isCompleted: todo.isCompleted)
    }
}
