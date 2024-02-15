//
//  MockTodoApp.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

@main
struct MockTodoApp: App {
    @AppStorage("isOnboarded") var isOnboarded: Bool = false
    @AppStorage("username") var username: String = ""
    
    var body: some Scene {
        WindowGroup {
            if isOnboarded {
                NavigationView {
                    ToDoListView(viewModel: ToDoViewModel(useCase: ToDoUseCase(repository: UserDefaultsToDoRepository()))).navigationTitle("Welcome \(username)")
                }
            } else {
                OnboardingView(viewModel: OnboardingViewModel(
                    useCase: OnboardingUseCase(
                    repository: MockOnboardingRepository()),
                    username: username,
                    isOnborded: $isOnboarded)
                )
            }
        }
    }
    
    private struct Constants {
        static let isOnboardedKey = "isOnboarded"
        static let usernameKey = "username"
    }
}

