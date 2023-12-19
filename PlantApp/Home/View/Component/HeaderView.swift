//
//  HomeHeaderView.swift
//  PlantApp
//
//  Created by Emre Dagci on 7.12.2023.
//

import SwiftUI

struct HeaderView: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Binding var text: String
    
    var body: some View {
        ZStack {
            Image(.homeHeader)
                .resizable()
                .frame(height: 175)
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text(LocalizedStringKey("home.title"))
                    .font(Fonts.regular.custom(size: 16))
                Spacer().frame(height: 6)
                Text(greetingMessage)
                    .font(Fonts.medium.custom(size: 22))
                Spacer().frame(height: 10)
                textFieldArea
                Spacer().frame(height: 14)
            }.padding([.leading, .trailing], 24)
        }
        .frame(height: 175)
        .padding(.top, -(safeAreaInsets.top + (safeAreaInsets.top > 20 ? 0 : 25)))
    }
    
    var greetingMessage: LocalizedStringKey {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            return LocalizedStringKey("home.greetings-morning")
        case 12..<18:
            return LocalizedStringKey("home.greetings-afternoon")
        case 18..<24:
            return LocalizedStringKey("home.greetings-evening")
        default:
            return LocalizedStringKey("home.greetings-night")
        }
    }
    
    var textFieldArea: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(LocalizedStringKey("home.placeholder")).foregroundColor(.appLightGray2)
                }
                .padding(.all, 13)
                .padding(.leading, 35)
            Image(.search)
                .renderingMode(.template)
                .foregroundColor(.appLightGray2)
                .frame(width: 20, height: 20)
                .padding(.leading, 16)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12).stroke(.appLightGray2.opacity(0.25))
        )
        .background(Color.white.opacity(0.88))
        .cornerRadius(12)
    }
}

#Preview {
    HeaderView(text: .constant(""))
}
