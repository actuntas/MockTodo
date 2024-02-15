//
//  OnboardingUseCase.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

final class OnboardingUseCase {
    private let repository: OnboardingRepository
    
    init(repository: OnboardingRepository) {
        self.repository = repository
    }
    
    func getOnboardingData() -> [OnboardingDatasource] {
        return repository.fetchOnboardingData()
    }
}
