//
//  MockOnboardingRepository.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

class MockOnboardingRepository: OnboardingRepository {
    func fetchOnboardingData() -> [OnboardingDatasource] {
        return OnboardingDatasource.mock()
    }
}
