//
//  TabViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

class TabViewModel: ObservableObject {
    @Published var selectedTab: Tab
    @Published var lastSelectedTab: Tab
    
    @Published var selectedSecondTab: SecondTab
    
    @Published var isEditMode: Bool = true
    
    @Published var notificationVisible = false
    var notificationMessage = ""
    
    init() {
        lastSelectedTab = .home
        selectedTab = .home
        selectedSecondTab = .delete
    }
    
    func isSelected(tab: Tab) -> Bool{
        return tab == selectedTab
    }
    
    func changeSelected(tab: Tab) {
        lastSelectedTab = selectedTab
        selectedTab = tab
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
    
    func isSelectedSecond(tab: SecondTab) -> Bool{
        return tab == selectedSecondTab
    }
    
    func changeSelectedSecond(tab: SecondTab) {
        switch tab {
        case .back:
            isEditMode.toggle()
        case .delete:
            notificationMessage = "The delete button was pressed."
            showNotification()
        case .unfavourite:
            notificationMessage = "The unfavorite button was pressed."
            showNotification()
        case .favourite:
            notificationMessage = "The favorite button was pressed."
            showNotification()
        }
    }
    
    func showNotification() {
        notificationVisible = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.notificationVisible = false
        }
    }
    
}
