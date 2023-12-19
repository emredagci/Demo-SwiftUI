//
//  PremiumFeatureItemView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation

import SwiftUI

struct PremiumFeatureListItemView: View {
    
    let item: PremiumFeatureModel
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.white.opacity(0.05).blur(radius: 2)
            VStack(alignment: .leading, spacing: 0) {
                Image(item.imageName ?? "")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: 32)
                Spacer().frame(height: 16)
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title ?? "")
                        .multilineTextAlignment(.leading)
                        .font(Fonts.medium.custom(size: 20))
                        .foregroundStyle(.white)
                    Text(item.subtitle ?? "")
                        .font(Fonts.regular.custom(size: 13))
                        .foregroundStyle(.white.opacity(0.7))
                }
            }
            .padding(.all, 16)
        }
        .aspectRatio(156 / 130, contentMode: .fit)
        .cornerRadius(14)
    }
}

#Preview {
    PremiumFeatureListItemView(
        item: PremiumFeatureModel(title: "Unlimited", subtitle: "Plant identify")
    )
}
