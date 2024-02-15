//
//  OnboardingButton.swift
//  TodoMate
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

struct OnboardingButton: View {
    let title: String
    let action: () -> Void
    let bordered: Bool
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .foregroundColor(bordered ? .white : .primary)
                .background(bordered ? Color.black : Color.clear)
                .font(.headline)
                .clipShape(RoundedRectangle(cornerRadius: bordered ? 10 : 0))
        }
    }
}

#Preview {
    OnboardingButton(title: "Test", action: {}, bordered: true)
}
