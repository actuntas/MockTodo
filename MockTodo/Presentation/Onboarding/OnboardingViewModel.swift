//
//  OnboardingViewModel.swift
//  TodoMate
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var selectedPage = 0
    @Binding var isOnboarded: Bool
    @Binding var username: String
    
    private let useCase: OnboardingUseCase
    private(set) var datasource: [OnboardingDatasource] = []
    
    init(useCase: OnboardingUseCase, isOnboarded: Binding<Bool>, username: Binding<String>) {
        self.useCase = useCase
        self._isOnboarded = isOnboarded
        self._username = username
        self.datasource = useCase.getOnboardingData()
    }
    
    var currentPageData: OnboardingDatasource {
        datasource[selectedPage]
    }

    func nextAction() {
        if selectedPage < datasource.count - 1 {
            selectedPage += 1
        }
    }

    func skipAction() {
        selectedPage = datasource.count - 1
    }
    
    func completeOnboarding() {
        isOnboarded = true
    }
}
