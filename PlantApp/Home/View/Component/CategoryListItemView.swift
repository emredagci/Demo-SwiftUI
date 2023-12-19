//
//  CategoryListItemView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import SwiftUI

struct CategoryListItemView: View {
    
    let item: CategoryModel
    let itemWidth = (UIScreen.main.bounds.width - (2 * 24) - 10) / 2
    
    var body: some View {
        ZStack(alignment: .leading) {
            AsyncImage(url: URL(string: (item.image?.url ?? ""))) {image in
                image.resizable()
            } placeholder: {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
            VStack(spacing: 0) {
                Text(item.title ?? "")
                    .frame(alignment: .leading)
                    .font(Fonts.medium.custom(size: 16))
                    .foregroundStyle(.black)
                    .padding([.leading, .top], 14)
                    .padding(.trailing, 24)
                Spacer()
            }
        }
        .aspectRatio(158 / 152, contentMode: .fit)
        .frame(width: itemWidth)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12).stroke(Color(.appLightGray), lineWidth: 0.5)
        )
    }
    
}

#Preview {
    CategoryListItemView(item: CategoryModel(
        id: 1,
        title: "Plant",
        image: CategoryImageModel(url:"https://cms-cdn.plantapp.app/6_edbcc6988a/6_edbcc6988a.png"))
    )
}
