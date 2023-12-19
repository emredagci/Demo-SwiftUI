//
//  PremiumHStackListView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import SwiftUI

struct PremiumFeatureHStackListView: View {
    
    let items: [PremiumFeatureModel]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 8) {
                    ForEach(items, id: \.self) { item in
                        PremiumFeatureListItemView(item: item)
                    }
                }.padding(.horizontal, 24)
            }
        }
    }
    
}

#Preview {
    PremiumFeatureHStackListView(items: [
        PremiumFeatureModel(),
        PremiumFeatureModel(),
        PremiumFeatureModel()
    ])
}
