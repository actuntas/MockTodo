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

enum AppColors {
    static func primaryDark() -> Color {
        Color(uiColor: UIColor(named: "PrimaryDark")!)
    }
    
    static func primaryLight() -> Color {
        Color(uiColor: UIColor(named: "PrimaryLight")!)
    }
    
    static func base() -> Color {
        Color(uiColor: UIColor(named: "Base")!)
    }
    
    static func pastelGreen() -> Color {
        Color(uiColor: UIColor(named: "PastelGreen")!)
    }
    
    static func pastelRed() -> Color {
        Color(uiColor: UIColor(named: "PastelRed")!)
    }
}
