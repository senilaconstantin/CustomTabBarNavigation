//
//  HistoryViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 27.02.2024.
//

import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var selectedEditTab: SecondTab
    
    @Published var notificationVisible: Bool = false
    var notificationMessage = ""
    
    init() {
        selectedEditTab = .back
    }
    
    func isSelectedButtonEditTab(tab: SecondTab) -> Bool{
        return tab == selectedEditTab
    }
    
    func editAction(tabType: Binding<TabType>) {
        switch tabType.wrappedValue {
        case .mainTab:
            print("Pressed Edit")
            tabType.wrappedValue = .editTab
        case .editTab:
            print("Pressed Save")
            tabType.wrappedValue = .mainTab
        }
    }
    
    func changeSelected(tab: SecondTab, tabType: Binding<TabType>) {
        selectedEditTab = tab
        switch tab {
        case .back:
            tabType.wrappedValue = .mainTab
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
    
    func getTitleButton(tabType: TabType) -> String {
        return tabType == .mainTab ? "Edit" : "Save"
    }
    
    func isEditMode(tabType: TabType) -> Bool {
        return tabType == .editTab
    }
}
