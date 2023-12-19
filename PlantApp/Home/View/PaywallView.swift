//
//  PaywallView.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import SwiftUI

struct PaywallView: View {
    
    @StateObject var viewModel = PaywallViewModel()
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.openURL) var openURL
    @Binding var isPresented: Bool
    @State var selectedSubscription: SubscriptionModel?
    @AppStorage(StorageKeys.isPaywallShowed) private var isPaywallShowed = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 0) {
                    mergedTitle.foregroundColor(.white).padding(.horizontal, 24)
                    Text("paywall.subtitle")
                        .font(Fonts.light.custom(size: 17))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                    Spacer().frame(height: 20)
                    PremiumFeatureHStackListView(items: viewModel.premiumFeatureList)
                    Spacer().frame(height: 28)
                    SubscriptionVStackListView(items: viewModel.subscriptionList, selectedSubscription: $selectedSubscription)
                    Spacer().frame(height: 26)
                    Button(action: {
                        hidePaywallView()
                    }, label: {
                        if selectedSubscription?.tryFree == true {
                            ButtonView(localeKey: "paywall.button")
                        } else {
                            ButtonView(localeKey: "paywall.purchase")
                        }
                        
                    })
                    Spacer().frame(height: 55)
                }
                .rotationEffect(Angle(degrees: 180))
            }
            .rotationEffect(Angle(degrees: -180))
            .scrollBounceBehavior(ScrollBounceBehavior.basedOnSize)
            VStack(alignment: .trailing) {
                Button(action: {
                    hidePaywallView()
                }, label: {
                    Image(.close).frame(width: 24, height: 24)
                })
                .frame(width: 40, height: 40)
                .padding(.trailing, 11)
                Spacer().frame(maxWidth: .infinity)
            }
            
            VStack {
                Spacer()
                if selectedSubscription?.tryFree == true {
                    Text(LocalizedStringKey("paywall.description"))
                        .font(Fonts.light.custom(size: 9))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                        .foregroundColor(.white.opacity(0.52))
                    Spacer().frame(height: 10)
                }
                HStack {
                    Button(action: {
                        open(url: "https://plantapp.app/terms")
                    }, label: {
                        Text(LocalizedStringKey("paywall.terms"))
                            .font(Fonts.light.custom(size: 11))
                            .foregroundColor(.white.opacity(0.5))
                    })
                    dotText
                    Button(action: {
                        open(url: "https://plantapp.app/privacy")
                    }, label: {
                        Text(LocalizedStringKey("paywall.privacy"))
                            .font(Fonts.light.custom(size: 11))
                            .foregroundColor(.white.opacity(0.5))
                    })
                    dotText
                    Button(action: {
                        hidePaywallView()
                    }, label: {
                        Text(LocalizedStringKey("paywall.restore"))
                            .font(Fonts.light.custom(size: 11))
                            .foregroundColor(.white.opacity(0.5))
                    })
                }
                Spacer().frame(height: safeAreaInsets.bottom == 0 ? 4 : 0)
                
            }
        }.background {
            Image(.paywallBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.top, -(safeAreaInsets.top - (safeAreaInsets.bottom > 0 ? 0 : 120)))
                .padding(.bottom, -safeAreaInsets.bottom)
        }.onAppear(perform: {
            isPaywallShowed = true
        })
    }
    
    func open(url: String) {
        if let url = URL(string: url) {
            openURL(url)
        }
    }
    
    var dotText: some View {
        Text("•")
            .font(Fonts.light.custom(size: 11))
            .foregroundColor(.white.opacity(0.5))
    }
    
    var mergedTitle: some View {
        Text(LocalizedStringKey("app")).font(Fonts.medium.custom(size: 30)) +
        Text(LocalizedStringKey("paywall.title")).font(Fonts.light.custom(size: 27))
    }
    
    private func hidePaywallView() {
        isPresented = false
    }
    
}

#Preview {
    PaywallView(isPresented: .constant(true))
}
