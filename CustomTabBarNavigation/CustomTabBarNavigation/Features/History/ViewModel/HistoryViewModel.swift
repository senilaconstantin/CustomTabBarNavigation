//
//  HistoryViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 27.02.2024.
//

import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var tabs: [TabBarItemModel]
    @Published var selectedTab: Int
    
    @Published var notificationVisible: Bool = false
    var notificationMessage = ""
    
    init() {
        tabs = [TabBarItemModel(iconName: "arrow.backward"),
                TabBarItemModel(iconName: "trash.fill", color: .red),
                TabBarItemModel(iconName: "star.slash.fill"),
                TabBarItemModel(iconName: "star.fill", color: .yellow)]
        selectedTab = 0
    }
    
    func isSelectedButtonEditTab(tabIndex: Int) -> Bool{
        return tabIndex == selectedTab
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
    
    func changeSelected(tabIndex: Int, tabType: Binding<TabType>) {
        selectedTab = tabIndex
        switch selectedTab {
        case 0: // back
            tabType.wrappedValue = .mainTab
        case 1: // delete
            notificationMessage = "The delete button was pressed."
            showNotification()
        case 2: // unfavourite
            notificationMessage = "The unfavorite button was pressed."
            showNotification()
        case 3: // favourite
            notificationMessage = "The favorite button was pressed."
            showNotification()
        default:
            print("Edit error")
        }
    }
    
    func showNotification() {
        notificationVisible = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.notificationVisible = false
        }
    }
    
    func getTitleButton(tabType: TabType) -> String {
        return self.isEditMode(tabType: tabType) ? "Save" : "Edit"
    }
    
    func isEditMode(tabType: TabType) -> Bool {
        return tabType == .editTab
    }
}
