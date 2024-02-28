//
//  TabViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

class TabViewModel: ObservableObject {
    @Published var tabs: [TabBarItemModel]
    @Published var selectedTab: Int
    @Published var isPushingFromLeft = false
   
    init() {
        tabs = [TabBarItemModel(iconName: "house.fill"),
                TabBarItemModel(iconName: "magnifyingglass"),
                TabBarItemModel(iconName: "clock"),
                TabBarItemModel(iconName: "person.fill")]
        selectedTab = 0
    }
    
    func isSelected(tabIndex: Int) -> Bool{
        return tabIndex == selectedTab
    }
    
    func changeSelected(tabIndex: Int) {
        let dif = tabIndex - selectedTab
        if dif < 0 {
            isPushingFromLeft = false
        } else {
            isPushingFromLeft = true
        }
        withAnimation(.easeInOut) {
            selectedTab = tabIndex
        }
    }  
}
