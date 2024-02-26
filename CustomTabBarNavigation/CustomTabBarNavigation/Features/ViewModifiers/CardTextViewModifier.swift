//
//  CardTextViewModifier.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct CardTextViewModifier: ViewModifier {
    var size: Double
    var weight: Font.Weight
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundColor(color)
            .fixedSize(horizontal: false, vertical: true)
    }
}

extension View {
    func cardTextStyle(size: Double, weight: Font.Weight, color: Color) -> some View {
        modifier(CardTextViewModifier(size: size, weight: weight, color: color))
    }
}
