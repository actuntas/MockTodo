//
//  OnboardingContentView.swift
//  TodoMate
//
//  Created by Can Tuntaş on 15.02.2024.
//

import SwiftUI

struct OnboardingContentView<Content: View>: View {
    let iconName: String?
    let title: String
    let text: String
    let content: Content
    
    init(iconName: String? = nil, title: String, text: String, @ViewBuilder content: () -> Content) {
        self.iconName = iconName
        self.title = title
        self.text = text
        self.content = content()
    }
    
    var body: some View {
        VStack {
            Text("TaskMate")
                .font(.custom("Oxygen-Bold", size: 24))
                .foregroundStyle(.white)
                .padding(.bottom, 40)
            
            if let iconName = iconName {
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
            }
            
            content
            
            Spacer()
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.custom("Oxygen-Bold", size: 20))
                Text(text)
                    .font(.custom("Oxygen-Regular", fixedSize: 14))
            }
            .foregroundStyle(.black)
            .padding(.horizontal, 24)
                
            Spacer()
        }
    }
}


struct OnboardingSliderView: View {
    let iconName: String
    let title: String
    let text: String
    
    var body: some View {
        OnboardingContentView(iconName: iconName, title: title, text: text) {
            Spacer().frame(height: 0) // No additional content here
        }
    }
}

struct UsernameSliderView: View {
    @Binding var username: String
    let title: String
    let text: String
    
    var body: some View {
        OnboardingContentView(title: title, text: text) {
            Spacer()
            GroupBox {
                TextField("Type your username", text: $username)
                    .textFieldStyle(.plain)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
            }
        }
    }
}
