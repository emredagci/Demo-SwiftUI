//
//  GetStartedView.swift
//  PlantApp
//
//  Created by Emre Dagci on 7.12.2023.
//

import SwiftUI

struct GetStartedView: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Binding var state: AppState
    @State private var action: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer().frame(height: 12)
            mergedWelcomeText
                .foregroundColor(Color(.darkGreen))
                .padding(.horizontal, 24)
            Spacer().frame(height: 8)
            Text(LocalizedStringKey("get-started.subtitle"))
                .font(Fonts.regular.custom(size: 16))
                .foregroundColor(Color(.lightGreen2))
                .padding(.horizontal, 24)
            Spacer()
            Button(action: {
                state = .onboarding
            }, label: {
                ButtonView(localeKey: "get-started.button")
            })
            VStack {
                Spacer()
                mergedAgreementText
                    .font(Fonts.regular.custom(size: 11))
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.lightGreen))
                    .accentColor(Color(.lightGreen))
                Spacer().frame(height: 8)
            }.frame(height: 55)
        }.background {
            backgroundImage
        }
    }
    
    var backgroundImage: some View {
        Image(.getStartedBackground)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.top, -(safeAreaInsets.top - (safeAreaInsets.bottom > 0 ? 0 : 20)))
            .padding(.bottom, -safeAreaInsets.bottom)
    }
    
    var mergedWelcomeText: some View {
        Text(LocalizedStringKey("get-started.welcome")).font(Fonts.regular.custom(size: 28)) +
        Text(LocalizedStringKey("app")).font(Fonts.medium.custom(size: 28))
    }
    
    var mergedAgreementText: some View {
        Text(LocalizedStringKey("get-started.agreement")) +
        Text(LocalizedStringKey("get-started.terms")).underline() +
        Text(LocalizedStringKey("get-started.agreement-and")) +
        Text(LocalizedStringKey("get-started.privacy")).underline()
    }
    
}

#Preview {
    GetStartedView(state: .constant(.getStarted))
}
