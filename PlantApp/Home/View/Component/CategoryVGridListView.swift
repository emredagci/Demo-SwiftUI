//
//  CategoryVGridView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import SwiftUI

struct CategoryVGridListView: View {
    
    var data: [CategoryModel]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    CategoryListItemView(item: item)
                }
            }
        }
        .padding([.leading, .trailing], 24)
    }
    
}

#Preview {
    CategoryVGridListView(data: [
        CategoryModel(),
        CategoryModel(),
        CategoryModel()
    ])
}
