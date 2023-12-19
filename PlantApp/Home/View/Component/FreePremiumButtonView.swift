//
//  FreePremiumButtonView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import SwiftUI

struct FreePremiumButtonView: View {
    
    var body: some View {
        ZStack {
            Color(.appBrown)
            HStack(spacing: 0) {
                Spacer().frame(width: 20)
                Image(.freePremiumInbox)
                    .frame(width: 36, height: 30)
                    .padding(.top, 6)
                Spacer().frame(width: 16)
                VStack(alignment: .leading, spacing: 0) {
                    freePremiumText
                    upgradeText
                }
                Spacer()
                Image(.arrow)
                    .renderingMode(.template)
                    .foregroundColor(.gold)
                    .frame(width: 24, height: 24)
                Spacer().frame(width: 12)
            }
        }
        .cornerRadius(15)
        .padding([.leading, .trailing], 24)
        .frame(height: 56)
    }
    
    var freePremiumText: some View {
        Text(LocalizedStringKey("free-premium.title"))
            .font(Fonts.medium.custom(size: 16))
            .multilineTextAlignment(.leading)
            .foregroundStyle(LinearGradient(
                colors: [Color(.lightGold), Color(.gold)],
                startPoint: .leading,
                endPoint: .trailing
            ))
    }
    
    var upgradeText: some View {
        Text(LocalizedStringKey("free-premium.description"))
            .font(Fonts.regular.custom(size: 13))
            .multilineTextAlignment(.leading)
            .foregroundStyle(LinearGradient(
                colors: [Color(.gold), Color(.lightGold)],
                startPoint: .leading,
                endPoint: .trailing
            ))
    }
    
}

#Preview {
    FreePremiumButtonView()
}
