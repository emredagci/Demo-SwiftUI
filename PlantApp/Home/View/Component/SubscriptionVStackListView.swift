//
//  SubscriptionVStackListView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import SwiftUI

struct SubscriptionVStackListView: View {
    
    let items: [SubscriptionModel]
    @Binding var selectedSubscription: SubscriptionModel?
    
    var body: some View {
        LazyVStack(spacing: 12) {
            ForEach(items, id: \.self) { item in
                Button {
                    selectedSubscription = item
                } label: {
                    SubscriptionListItemView(item: item, selectedSubscription: $selectedSubscription)
                }
            }
        }
        .padding(.horizontal, 24)
        .onAppear(perform: {
            selectedSubscription = items.first(where: { $0.tryFree == true })
        })
    }
    
}

#Preview {
    SubscriptionVStackListView(items: [
        SubscriptionModel(),
        SubscriptionModel(),
        SubscriptionModel()
    ], selectedSubscription: .constant(nil))
}
