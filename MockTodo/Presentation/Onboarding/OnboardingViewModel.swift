//
//  OnboardingViewModel.swift
//  TodoMate
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

final class OnboardingViewModel: ObservableObject {
    @Published var selectedPage = 0
    @Binding var isOnboarded: Bool
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    private let useCase: OnboardingUseCase
    private(set) var datasource: [OnboardingDatasource] = []

    init(useCase: OnboardingUseCase, username: String, isOnborded: Binding<Bool>) {
        self.useCase = useCase
        self.username = username
        self.datasource = useCase.getOnboardingData()
        self._isOnboarded = isOnborded
    }
    
    var currentPageData: OnboardingDatasource { datasource[selectedPage] }


    func nextAction() {
        if selectedPage < datasource.count - 1 {
            selectedPage += 1
        }
    }

    func skipAction() {
        selectedPage = datasource.count - 1
    }
    
    func completeOnboarding() {
        isOnboarded.toggle()
    }
}

class OnboardingViewModel2: ObservableObject {
    @Published var selectedPage = 0
    @Binding var isOnboarded: Bool
    @Binding var username: String
    
    let datasource: [OnboardingDatasource]

    init(dataSource: [OnboardingDatasource], isOnboarded: Binding<Bool>, username: Binding<String>) {
        self.datasource = dataSource
        self._isOnboarded = isOnboarded
        self._username = username
    }
    
    var currentPageData: OnboardingDatasource { datasource[selectedPage] }

    func nextAction() {
        selectedPage += 1
    }

    func skipAction() {
        selectedPage = datasource.count - 1
    }
    
    func completeOnboarding() {
        isOnboarded = true
    }
}
