//
//  OnboardingView.swift
//  TodoMate
//
//  Created by Can Tuntaş on 14.02.2024.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        let backgroundColor = viewModel.currentPageData.backgroundColor
        ZStack(alignment: .top) {
            backgroundColor.ignoresSafeArea()
            VStack {
                onboardingView.padding(.vertical, 20)
                buttonStack.padding(.trailing)
            }.padding()
        }.onAppear(perform: setupAppearance).transition(.opacity).animation(.easeInOut(duration: 0.3), value: viewModel.selectedPage)
    }
    
    private func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    private var onboardingView: some View {
        TabView(selection: $viewModel.selectedPage) {
            ForEach(viewModel.datasource.indices, id: \.self) { index in
                if index < (viewModel.datasource.count - 1) {
                    OnboardingSliderView(iconName: viewModel.currentPageData.iconName ?? "",
                                         title: viewModel.currentPageData.title,
                                         text: viewModel.currentPageData.text)
                    .tag(index)
                } else {
                    UsernameSliderView(username: $viewModel.username,
                                       title: viewModel.datasource[index].title,
                                       text: viewModel.datasource[index].text)
                    .tag(index)
                }
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
    
    private var buttonStack: some View {
        HStack {
            if viewModel.selectedPage == (viewModel.datasource.count - 1) {
                startButton(title: Constants.startButtonTitle, action: viewModel.completeOnboarding)
            } else {
                skipButton
                Spacer().frame(width: UIScreen.main.bounds.width / 4)
                nextButton
            }
        }
    }
    
    private var skipButton: some View {
        OnboardingButton(title: Constants.skipButtonTitle, action: viewModel.skipAction, bordered: false)
    }
    
    private var nextButton: some View {
        OnboardingButton(title: Constants.nextButtonTitle, action: viewModel.nextAction, bordered: true)
    }
    
    private func startButton(title: String, action: @escaping () -> Void) -> some View {
        OnboardingButton(title: title, action: action, bordered: true)
    }
    
    private enum Constants {
        static let skipButtonTitle = "Skip"
        static let nextButtonTitle = "Next"
        static let startButtonTitle = "Get Started"
    }
}
