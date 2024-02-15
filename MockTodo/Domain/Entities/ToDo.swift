//
//  ToDo.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

struct ToDo: Identifiable {
    let id: UUID = UUID()
    var isCompleted: Bool = false
    var title: String
}
