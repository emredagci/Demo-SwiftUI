//
//  Fonts.swift
//  PlantApp
//
//  Created by Emre Dagci on 8.12.2023.
//

import Foundation
import SwiftUI

enum Fonts: String {
    case extraBold = "Rubik-ExtraBold"
    case light = "Rubik-Light"
    case regular = "Rubik-Regular"
    case medium = "Rubik-Medium"
    
    func custom(size: CGFloat) -> Font {
        return .custom(rawValue, size: size)
    }
}
