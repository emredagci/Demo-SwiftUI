//
//  PaywallViewModel.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation

@MainActor
class PaywallViewModel : ObservableObject {
    
    @Published var premiumFeatureList: [PremiumFeatureModel] = [
        PremiumFeatureModel(imageName: "premium-unlimited", title: "Unlimited", subtitle: "Plant Identify"),
        PremiumFeatureModel(imageName: "premium-faster", title: "Faster", subtitle: "Process"),
        PremiumFeatureModel(imageName: "premium-detailed", title: "Detailed", subtitle: "Plant care"),
    ]
    @Published var subscriptionList: [SubscriptionModel] = [
        SubscriptionModel(id: "plantapp.one.month", duration: "1 Month", feeMessage: "$2.99/month, auto renewable"),
        SubscriptionModel(id: "plantapp.one.year",duration: "1 Year", feeMessage: "First 3 days free, then $529,99/year", discount: "Save 50%", tryFree: true),
    ]
    
}
