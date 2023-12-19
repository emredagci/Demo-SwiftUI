//
//  IndicatorView.swift
//  PlantApp
//
//  Created by Emre Dagci on 7.12.2023.
//

import SwiftUI

struct IndicatorView: View {
    
    @Binding var count: Int
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<self.count, id: \.self) { item in
                ZStack {
                    if selectedIndex == item {
                        Image(.pageIndicator)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(.darkGreen))
                            .frame(width: 10, height: 10)
                    } else {
                        Image(.pageIndicator)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(.darkGreen).opacity(0.25))
                            .frame(width: 6, height: 6)
                    }
                }.frame(width: 10, height: 10)
            }
        }
    }
    
}

#Preview {
    IndicatorView(count: .constant(0), selectedIndex: .constant(0))
}
