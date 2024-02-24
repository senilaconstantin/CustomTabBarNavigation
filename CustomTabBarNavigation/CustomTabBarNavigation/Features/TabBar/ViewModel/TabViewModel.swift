//
//  TabViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

class TabViewModel: ObservableObject {
    @Published var selectedTab: Tab
    @Published var selectedSecondTab: SecondTab
    init() {
        selectedTab = .home
        selectedSecondTab = .delete
    }
    
    func isSelected(tab: Tab) -> Bool{
        return tab == selectedTab
    }
    
    func changeSelected(tab: Tab) {
        selectedTab = tab
    }
    
    func isSelectedSecond(tab: SecondTab) -> Bool{
        return tab == selectedSecondTab
    }
    
    func changeSelectedSecond(tab: SecondTab) {
        selectedSecondTab = tab
    }
    
}
