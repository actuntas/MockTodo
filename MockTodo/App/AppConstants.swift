//
//  AppConstants.swift
//  MockTodo
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

enum AppConstants {
    static let appName = "MockToDo"
}

enum StorageConstants {
    static let isOnboardedKey = "isOnboarded"
    static let usernameKey = "username"
}

enum AppColors {
    static func primaryDark() -> Color {
        Color.primaryDark
    }
    
    static func primaryLight() -> Color {
        Color.primaryLight
    }
    
    static func base() -> Color {
        Color.base
    }
    
    static func pastelGreen() -> Color {
        Color.pastelGreen
    }
    
    static func pastelRed() -> Color {
        Color.pastelRed
    }
}
