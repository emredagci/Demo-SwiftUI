//
//  TabBarItemView.swift
//  PlantApp
//
//  Created by Emre Dagci on 9.12.2023.
//

import SwiftUI

struct TabBarItemView: View {
    
    @Binding var selectedTab: Int
    let index: Int
    let image: Image
    let localeKey: LocalizedStringKey
    
    var body: some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack(spacing: 0) {
                image
                    .renderingMode(.template)
                    .foregroundColor(selectedTab == index ? .appGreen : .appLightGray2)
                    .frame(width: 25, height: 25)
                Text(localeKey)
                    .font(.caption)
            }
        }
        .foregroundColor(selectedTab == index ? .appGreen : .appLightGray2)
        .frame(width: UIScreen.main.bounds.width / 5, height: 50)
    }
}

#Preview {
    TabBarItemView(
        selectedTab: .constant(0),
        index: 0,
        image: Image(.home),
        localeKey: LocalizedStringKey("tab_home")
    )
}
