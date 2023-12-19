//
//  OnboardingView.swift
//  PlantApp
//
//  Created by Emre Dagci on 7.12.2023.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Binding var state: AppState
    @State private var selectedTab = 0
    @State private var isNavigationActive = false
    
    var body: some View {
        ZStack {
            tabView
            indicatorView
            continueButton
        }
    }
    
    var tabView: some View {
        TabView(selection: $selectedTab) {
            firstView
            secondView
        }
        .disabled(true)
        .padding(.top, -safeAreaInsets.top)
        .padding(.bottom, -safeAreaInsets.bottom)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeOut(duration: 0.2), value: selectedTab)
    }
    
    var continueButton: some View {
        VStack(spacing: 0) {
            Spacer()
            Button(action: {
                if (selectedTab == 1) {
                    state = .main
                } else {
                    selectedTab = 1
                }
            }, label: {
                ButtonView(localeKey: "onboarding.continue")
            })
            Spacer().frame(height: 55)
        }
    }
    
    var indicatorView: some View {
        VStack(spacing: 0) {
            Spacer()
            IndicatorView(count: .constant(2), selectedIndex: $selectedTab)
            Spacer().frame(height: 12)
        }
    }
    
    var firstView: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                    .frame(height: 12)
                    .frame(maxWidth: .infinity)
                Image(.onboardingFirstTitle)
                Spacer()
            }.padding(.horizontal, 24)
        }.background {
            Image(.onboardingFirstBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.top, -(safeAreaInsets.top - (safeAreaInsets.bottom > 0 ? 0 : 90)))
                .padding(.bottom, -safeAreaInsets.bottom)
        }.tag(0)
    }
        
    var secondView: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: 12)
                    .frame(maxWidth: .infinity)
                Image(.onboardingSecondTitle)
                Spacer()
            }.padding(.horizontal, 24)
        }.background {
            Image(.onboardingSecondBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.top, -(safeAreaInsets.top - (safeAreaInsets.bottom > 0 ? 0 : 90)))
                .padding(.bottom, -safeAreaInsets.bottom)
        }.tag(1)
    }
    
}

#Preview {
    OnboardingView(state: .constant(.onboarding))
}
