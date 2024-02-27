//
//  HistoryViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 27.02.2024.
//

import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var selectedEditTab: SecondTab
    @Published var tabType: TabType
    
    @Published var notificationVisible: Bool = false
    var notificationMessage = ""
    
    init() {
        selectedEditTab = .back
        tabType = .mainTab
    }
    
    func isSelectedButtonEditTab(tab: SecondTab) -> Bool{
        return tab == selectedEditTab
    }
    
    func editAction() {
        switch tabType {
        case .mainTab:
            print("Pressed Edit")
            tabType = .editTab
        case .editTab:
            print("Pressed Save")
            tabType = .mainTab
        }
    }
    
    func changeSelected(tab: SecondTab) {
        selectedEditTab = tab
        switch tab {
        case .back:
            tabType = .mainTab
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
    
    func getTitleButton() -> String {
        return tabType == .mainTab ? "Edit" : "Save"
    }
}
