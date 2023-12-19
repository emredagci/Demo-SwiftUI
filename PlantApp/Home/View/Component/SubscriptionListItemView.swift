//
//  SubscriptionListItemView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import SwiftUI

struct SubscriptionListItemView: View {
    
    let item: SubscriptionModel
    @Binding var selectedSubscription: SubscriptionModel?
    
    var isSelected: Bool {
        return selectedSubscription?.id == item.id
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if isSelected == true {
                LinearGradient(colors: [
                    Color.appGreen.opacity(0.24),
                    Color.appGreen.opacity(0),
                    Color.appGreen.opacity(0)
                ], startPoint: .trailing, endPoint: .leading)
            } else {
                Color.white.opacity(0.05).blur(radius: 2)
            }
            HStack(spacing: 0) {
                radioButton
                Spacer().frame(width: 12)
                textAreaView
                Spacer()
            }
            .padding(.leading, 16)
            if item.discount != nil {
                discountView
            }
        }
        .cornerRadius(14)
        .overlay(
            RoundedRectangle(cornerRadius: 12).stroke(isSelected ? Color.appGreen : Color.white.opacity(0.3), lineWidth: isSelected ? 1.5 : 0.5)
        )
        .frame(height: 60)
    }
    
    var radioButton: some View {
        ZStack {
            Color.white.opacity(0.08)
            if isSelected {
                ZStack {
                    Color.appGreen
                    Color.white
                        .frame(width: 8, height: 8)
                        .cornerRadius(4)
                }
            }
            
        }
        .frame(width: 24, height: 24)
        .cornerRadius(12)
    }
    
    var textAreaView: some View {
        VStack(alignment: .leading) {
            Text(item.duration ?? "")
                .multilineTextAlignment(.leading)
                .font(Fonts.medium.custom(size: 16))
                .lineLimit(2)
                .foregroundStyle(.white)
            Text(item.feeMessage ?? "")
                .multilineTextAlignment(.leading)
                .font(Fonts.regular.custom(size: 12))
                .lineLimit(2)
                .foregroundStyle(.white)
        }
    }
    
    var discountView: some View {
        HStack {
            Spacer()
            VStack {
                Text(item.discount ?? "")
                    .padding(.vertical, 8)
                    .padding(.leading, 12)
                    .padding(.trailing, 9)
                    .font(Fonts.medium.custom(size: 12))
                    .foregroundColor(.white)
                    .background(Color.appGreen)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 26,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 0
                        )
                    )
                Spacer()
            }
            
        }.frame(maxHeight: .infinity)
    }
    
}

#Preview {
    SubscriptionListItemView(item: SubscriptionModel(
        duration: "1 Month",
        feeMessage: "$2.49",
        discount: "Save 50%"
    ), selectedSubscription: .constant(nil))
}
