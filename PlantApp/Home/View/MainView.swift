//
//  MainView.swift
//  PlantApp
//
//  Created by Emre Dagci on 9.12.2023.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @State var selectedTab: Int = 0
    @State private var isPresentedPaywallView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView(isPresentedPaywallView: $isPresentedPaywallView).tag(0)
                VStack {}.tag(1)
                VStack {}.tag(2)
                VStack {}.tag(3)
            }
            .padding(.bottom, 0)
            TabBarView(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
        .fullScreenCover(isPresented: $isPresentedPaywallView, content: {
            PaywallView(isPresented: $isPresentedPaywallView)
        })   
    }
    
}

#Preview {
    MainView()
}
