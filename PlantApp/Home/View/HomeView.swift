//
//  HomeView.swift
//  PlantApp
//
//  Created by Emre Dagci on 7.12.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @AppStorage(StorageKeys.isOnboardingCompleted) private var isOnboardingCompleted = false
    @AppStorage(StorageKeys.isPaywallShowed) private var isPaywallShowed = false
    @Binding var isPresentedPaywallView: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HeaderView(text: $viewModel.searchText)
                    .onChange(of: viewModel.searchText) {
                        viewModel.searchCategories()
                    }
                ScrollView {
                    VStack(spacing: 0) {
                        Spacer().frame(height: 24)
                        Button(action: {
                            showPaywallView()
                        }, label: {
                            FreePremiumButtonView()
                        })
                        Spacer().frame(height: 24)
                        Text("home.get-started")
                            .font(Fonts.medium.custom(size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading, .trailing], 24)
                        Spacer().frame(height: 17)
                        QuestionHStackListView(data: viewModel.questionList)
                        Spacer().frame(height: 24)
                        CategoryVGridListView(data: viewModel.categoryList)
                        Spacer().frame(height: 36)
                    }
                }
            }
            .navigationDestination(for: String.self) { url in
                WebView(url: url)
            }
            .onAppear(perform: {
                Task {
                    await viewModel.getQuestions()
                    await viewModel.getCategories()
                }
                isOnboardingCompleted = true
                if !isPaywallShowed {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.showPaywallView()
                    }
                }
            })
        }
    }
    
    private func showPaywallView() {
        isPresentedPaywallView = true
    }
    
}

#Preview {
    HomeView(isPresentedPaywallView: .constant(false))
}
