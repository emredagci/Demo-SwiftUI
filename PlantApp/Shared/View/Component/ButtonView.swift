//
//  ButtonView.swift
//  PlantApp
//
//  Created by Emre Dagci on 7.12.2023.
//

import SwiftUI

struct ButtonView: View {
    
    let localeKey: String
    
    var body: some View {
        ZStack {
            text
        }.padding([.leading, .trailing], 24)
    }
    
    var text: some View {
        Text(LocalizedStringKey(localeKey))
            .frame(maxWidth: .infinity, minHeight: 56)
            .foregroundColor(.white)
            .background(Color(.appGreen))
            .font(Fonts.medium.custom(size: 15))
            .cornerRadius(12)
            .buttonStyle(.borderless)
    }
    
}

#Preview {
    ButtonView(localeKey: "get_started")
}
