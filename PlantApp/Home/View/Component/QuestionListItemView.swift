//
//  QuestionListItemView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import SwiftUI

struct QuestionListItemView: View {
    
    let item: QuestionModel
    let itemWidth = (UIScreen.main.bounds.width * 240) / 375
    
    var body: some View {
        ZStack(alignment: .leading) {
            AsyncImage(url: URL(string: item.image_uri ?? "")) { image in
                image.resizable()
            } placeholder: {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text(item.title ?? "")
                    .multilineTextAlignment(.leading)
                    .font(Fonts.medium.custom(size: 15))
                    .lineLimit(2)
                    .foregroundStyle(.white)
                    .padding([.all], 14)
                    .frame(height: 68)
            }
            
        }
        .aspectRatio(240 / 164, contentMode: .fit)
        .frame(width: itemWidth)
        .cornerRadius(12)
    }
}

#Preview {
    QuestionListItemView(
        item: QuestionModel(
            id: 1,
            title: "Plants are where?",
            subtitle: "",
            image_uri: "https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2FCard.png?alt=media",
            uri: "",
            order: 1
        )
    )
}
