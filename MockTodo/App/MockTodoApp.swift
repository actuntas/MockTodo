//
//  MockTodoApp.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

@main
struct MockTodoApp: App {
    @AppStorage(StorageConstants.isOnboardedKey) var isOnboarded: Bool = false
    @AppStorage(StorageConstants.usernameKey) var username: String = ""
    
    var body: some Scene {
        WindowGroup {
            if isOnboarded {
                NavigationView {
                    ToDoListView(viewModel: ToDoViewModel(
                        useCase: ToDoUseCase(repository: UserDefaultsToDoRepository()))
                    )
                    .navigationTitle("Welcome \(username)")
                }
            } else {
                OnboardingView(viewModel: OnboardingViewModel(
                    useCase: OnboardingUseCase(repository: MockOnboardingRepository()),
                    username: username,
                    isOnboarded: $isOnboarded)
                )
            }
        }
    }
}

