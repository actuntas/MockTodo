//
//  ToDo.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

struct ToDo: Identifiable {
    let id: UUID
    var isCompleted: Bool
    var title: String
}
