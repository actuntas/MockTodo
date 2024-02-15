//
//  OnboardingDataSource.swift
//  TodoMate
//
//  Created by Can Tuntaş on 14.02.2024.
//

import SwiftUI

struct OnboardingDatasource {
    let iconName: String?
    let title: String
    let text: String
    let backgroundColor: Color
    
    static func mock() -> [Self] {
        [
            OnboardingDatasource(iconName: "list.bullet.clipboard.fill" , title: "Welcome to TaskMate", text: "Welcome to TaskMate application easy way of handling and managing your stuff.", backgroundColor: AppColors.primaryLight()),
            OnboardingDatasource(iconName: "list.bullet.clipboard.fill", title: "Welcome to TaskMate", text: "Welcome to TaskMate application voice way of handling and managing your stuff.", backgroundColor: AppColors.pastelGreen()),
            OnboardingDatasource(iconName: "list.bullet.clipboard.fill", title: "Welcome to TaskMate", text: "Welcome to TaskMate application cheerful way of handling and managing your stuff.", backgroundColor: AppColors.pastelRed()),
            OnboardingDatasource(iconName: nil, title: "Create your username", text: "You can change your username in Settings at any time.", backgroundColor: .secondary)
        ]
    }
}


