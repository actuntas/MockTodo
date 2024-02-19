//
//  OnboardingViewModel.swift
//  TodoMate
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

@MainActor
final class OnboardingViewModel: ObservableObject {
    @Published var selectedPage = 0
    @Published var username: String
    @Binding var isOnboarded: Bool
    
    private let useCase: OnboardingUseCase
    private(set) var datasource: [OnboardingDatasource] = []

    init(useCase: OnboardingUseCase, username: String, isOnboarded: Binding<Bool>) {
        self.useCase = useCase
        self.username = username
        self._isOnboarded = isOnboarded
        fetchOnboarding()
    }
    
    func fetchOnboarding() { datasource = useCase.getOnboardingData() }
    
    private func saveUsername() { useCase.saveUsername(username) }

    func nextAction() {
        if !isLastPage {
            selectedPage += 1
        }
    }

    func skipAction() {
        selectedPage = datasource.count - 1
    }
    
    func completeOnboarding() {
        saveUsername()
        isOnboarded.toggle()
    }
}

extension OnboardingViewModel {
    var currentPageData: OnboardingDatasource { datasource[selectedPage] }
    var currentBackgroundColor: Color { currentPageData.backgroundColor }
    var currentTitle: String { currentPageData.title }
    var currentText: String { currentPageData.text }
    var isLastPage: Bool { selectedPage == datasource.count - 1 }
}
