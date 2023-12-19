//
//  SubscriptionModel.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation

struct SubscriptionModel: Hashable {
    var id: String?
    var duration: String?
    var feeMessage: String?
    var discount: String?
    var tryFree: Bool?
}
