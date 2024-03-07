//
//  TabBarItem.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 27.02.2024.
//
import SwiftUI

struct TabBarItemModel {
    let iconName: String
    var color: Color = .gray
    var action: (inout [TabBarItemModel], inout TabType) -> Void = {tabs, tabType in}
}
