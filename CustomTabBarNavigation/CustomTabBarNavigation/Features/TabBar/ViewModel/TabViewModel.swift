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
        tabs = []
        selectedTab = 0
        tabs = [TabBarItemModel(iconName: "house.fill", action: {_, _ in self.changeSelected(tabIndex: 0)}),
                TabBarItemModel(iconName: "magnifyingglass", action: {_, _ in self.changeSelected(tabIndex: 1)}),
                TabBarItemModel(iconName: "clock", action: {_, _ in self.changeSelected(tabIndex: 2)}),
                TabBarItemModel(iconName: "person.fill", action: {_, _ in self.changeSelected(tabIndex: 3)})]
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
    
    func getColor(index: Int, tabType: TabType) -> Color {
        if tabType == .mainTab {
            return index == selectedTab ? .blue : tabs[index].color
        }
        return tabs[index].color
    }
}
