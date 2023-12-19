//
//  TabBarView.swift
//  PlantApp
//
//  Created by Emre Dagci on 9.12.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 0.5)
                .frame(maxWidth: .infinity)
                .background(Color.appGreen.opacity(0.1))
            HStack(spacing: 0) {
                TabBarItemView(selectedTab: $selectedTab, index: 0, image: Image(.home), localeKey: "main.home")
                TabBarItemView(selectedTab: $selectedTab, index: 1, image: Image(.diagnose), localeKey: "main.diagnose")
                ZStack {
                    Button(action: {
                        debugPrint("tapped scan")
                    }) {
                        Image(.scan)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 65, height: 65)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .clipShape(Circle())
                    }
                    .offset(y: -40)
                    .padding(.bottom, -30)
                }.frame(width: UIScreen.main.bounds.width / 5)
                TabBarItemView(selectedTab: $selectedTab, index: 2, image: Image(.garden), localeKey: "main.garden")
                TabBarItemView(selectedTab: $selectedTab, index: 3, image: Image(.profile), localeKey: "main.profile")
            }.background(Color.white)
        }   
    }
    
}

#Preview {
    TabBarView(selectedTab: .constant(0))
}
