//
//  QuestionHLinearView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import SwiftUI

struct QuestionHStackListView: View {
    
    let data: [QuestionModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(data, id: \.self) { item in
                    NavigationLink(value: item.uri) {
                        QuestionListItemView(item: item)
                    }
                }
            }.padding(.horizontal, 24)
        }
    }
    
}

#Preview {
    QuestionHStackListView(data: [
        QuestionModel(),
        QuestionModel(),
        QuestionModel()
    ])
}
