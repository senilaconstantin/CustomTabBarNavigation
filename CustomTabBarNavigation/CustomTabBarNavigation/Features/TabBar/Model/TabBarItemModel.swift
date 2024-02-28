//
//  TabBarItem.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 27.02.2024.
//
import SwiftUI

struct TabBarItemModel {
    let iconName: String
    let color: Color
    
    init(iconName: String, color: Color) {
        self.iconName = iconName
        self.color = color 
    }
    
    init(iconName: String) {
        self.iconName = iconName
        self.color = .gray
    }
}
