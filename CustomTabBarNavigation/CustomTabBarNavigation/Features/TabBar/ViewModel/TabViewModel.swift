//
//  TabViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

class TabViewModel: ObservableObject {
    @Published var selectedTab: Tab
    @Published var selectedEditTab: SecondTab
    
    @Published var isPushingFromLeft = false
    
    @Published var isEditMode: Bool = true
    
    @Published var notificationVisible: Bool = false
    var notificationMessage = ""
    
    init() {
        selectedTab = .home
        selectedEditTab = .delete
    }
    
    func isSelected(tab: Tab) -> Bool{
        return tab == selectedTab
    }
    
    func changeSelected(tab: Tab) {
        let dif = getIndex(tab: tab) -  getIndex(tab: selectedTab)
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
    
    func isSelectedButtonEditTab(tab: SecondTab) -> Bool{
        return tab == selectedEditTab
    }

    func editAction() {
        if isEditMode {
            print("Pressed Edit")
        } else {
            print("Pressed Save")
        }
        isEditMode.toggle()
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
