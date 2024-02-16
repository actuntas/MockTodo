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
}


