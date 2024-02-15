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
            OnboardingDatasource(
                iconName: "list.bullet.clipboard",
                title: "Get Organized",
                text: "Streamline your tasks and projects to enhance productivity.",
                backgroundColor: AppColors.primaryLight()
            ),
            OnboardingDatasource(
                iconName: "mic.fill",
                title: "Voice Entry",
                text: "Quickly add tasks using voice commands anytime, anywhere.",
                backgroundColor: AppColors.pastelGreen()
            ),
            OnboardingDatasource(
                iconName: "paintbrush.fill",
                title: "Customizable Themes",
                text: "Personalize your app experience with vibrant color themes.",
                backgroundColor: AppColors.pastelRed()
            ),
            OnboardingDatasource(
                iconName: nil,
                title: "Get Started",
                text: "Create your account to save and sync your tasks across devices.",
                backgroundColor: AppColors.base()
            )
        ]
    }
}



