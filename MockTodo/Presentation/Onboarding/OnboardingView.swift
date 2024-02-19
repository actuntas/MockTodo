//
//  OnboardingView.swift
//  TodoMate
//
//  Created by Can Tuntaş on 14.02.2024.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            viewModel.currentBackgroundColor.ignoresSafeArea()
            
            VStack {
                onboardingView.padding(.vertical, Constants.customPadding)
                buttonStack.padding(.trailing)
            }
            .padding()
        }
        .onAppear(perform: setPageControlTintColor)
        .onChange(of: viewModel.selectedPage) { _, _ in
            hideKeyboard()
        }
    }
    
    //MARK: - Helper Methods
    private func setPageControlTintColor() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    private func hideKeyboard() {
        DispatchQueue.main.async {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    
    //MARK: - Helper Views
    private var onboardingView: some View {
        TabView(selection: $viewModel.selectedPage) {
            ForEach(viewModel.datasource.indices, id: \.self) { index in
                if !viewModel.isLastPage {
                    OnboardingSliderView(iconName: viewModel.currentPageData.iconName ?? "",
                                         title: viewModel.currentTitle,
                                         text: viewModel.currentText)
                    .tag(index)
                } else {
                    UsernameSliderView(username: $viewModel.username,
                                       title: viewModel.currentTitle,
                                       text: viewModel.currentText)
                    .tag(index)
                }
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
    
    private var buttonStack: some View {
        HStack {
            if viewModel.isLastPage {
                startButton(title: Constants.startButtonTitle, action: viewModel.completeOnboarding)
            } else {
                skipButton
                Spacer().frame(width: UIScreen.main.bounds.width / 4)
                nextButton
            }
        }
    }
    
    private var skipButton: some View {
        OnboardingButton(title: Constants.skipButtonTitle,
                         action: viewModel.skipAction,
                         bordered: false)
    }
    
    private var nextButton: some View {
        OnboardingButton(title: Constants.nextButtonTitle,
                         action: viewModel.nextAction,
                         bordered: true)
    }
    
    private func startButton(title: String, action: @escaping () -> Void) -> some View {
        OnboardingButton(title: title, 
                         action: action,
                         bordered: true)
            .disabled(viewModel.username.isEmpty)
            .opacity(viewModel.username.isEmpty ? 0.2 : 1)
    }
    
    private enum Constants {
        static let skipButtonTitle = "Skip"
        static let nextButtonTitle = "Next"
        static let startButtonTitle = "Get Started"
        static let customPadding: CGFloat = 20
    }
}
