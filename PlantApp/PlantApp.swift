//
//  PlantAppApp.swift
//  PlantApp
//
//  Created by Emre Dagci on 7.12.2023.
//

import SwiftUI

@main
struct PlantApp: App {
    
    @State var appState: AppState = .getStarted
    @AppStorage(StorageKeys.isOnboardingCompleted) private var isOnboardingCompleted = false
    
    var body: some Scene {
        WindowGroup {
            if isOnboardingCompleted {
                MainView()
            } else {
                switch (appState) {
                case .getStarted:
                    GetStartedView(state: $appState)
                case .onboarding:
                    OnboardingView(state: $appState)
                case .main:
                    MainView()
                }
            }
        }
    }
    
}

enum AppState {
    case getStarted
    case onboarding
    case main
}
