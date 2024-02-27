//
//  TabViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

class TabViewModel: ObservableObject {
    @Published var selectedTab: Tab
    @Published var isPushingFromLeft = false
   
    init() {
        selectedTab = .home
    }
   
//    func getTransitionTab() -> Double {
//        let xTransitionTab: Double = -AppConstants.ScreenSize.width + 50
//       
//        return isPrincipalTab ? xTransitionTab : -xTransitionTab
//    }
    
    func isSelected(tab: Tab) -> Bool{
        return tab == selectedTab
    }
    
    func changeSelected(tab: Tab) {
        let dif = getIndex(tab: tab) - getIndex(tab: selectedTab)
        if dif < 0 {
            isPushingFromLeft = false
        } else {
            isPushingFromLeft = true
        }
        withAnimation(.easeInOut) {
            selectedTab = tab
        }
    }
    
    func getIndex(tab: Tab) -> Int {
        switch tab {
        case .home:
            return 0
        case .search:
            return 1
        case .history:
            return 2
        case .profile:
            return 3
        }
    }
    
}
