//
//  TabButtonViewModifier.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 25.02.2024.
//

import SwiftUI

struct TabButtoniewModifier: ViewModifier {
    var size: Double
    var scaleEffect: Double
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
            .foregroundColor(color)
            .scaleEffect(scaleEffect)
    }
}

extension View {
    func tabButtonStyle(size: Double, scaleEffect: Double, color: Color) -> some View {
        modifier(TabButtoniewModifier(size: size, scaleEffect: scaleEffect, color: color))
    }
}

