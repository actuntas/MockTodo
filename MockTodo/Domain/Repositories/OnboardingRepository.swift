//
//  OnboardingRepositoryProtocol.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import Foundation

protocol OnboardingRepository {
    func fetchOnboardingData() -> [OnboardingDatasource]
    func saveUsername(username: String)
}
