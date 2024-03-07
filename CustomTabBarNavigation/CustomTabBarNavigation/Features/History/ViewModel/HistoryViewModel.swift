//
//  HistoryViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 27.02.2024.
//

import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var tabs: [TabBarItemModel]
    var tabsInitial: [TabBarItemModel] = []
    @Published var selectedTab: Int
    
    @Published var notificationVisible: Bool = false
    
    @Published var list: [Int] = Array(0...100)
    var notificationMessage = ""
    
    init() {
        tabs = []
        selectedTab = 0
        tabs = [TabBarItemModel(iconName: "arrow.backward", action: {tabs, tabType in self.changeSelected(tabs: &tabs,
                                                                                                          tabType: &tabType)}),
                TabBarItemModel(iconName: "trash.fill", color: .red, action: {_, _ in self.changeSelected(tabIndex: 1)}),
                TabBarItemModel(iconName: "star.slash.fill", action: {_, _ in self.changeSelected(tabIndex: 2)}),
                TabBarItemModel(iconName: "star.fill", color: .yellow, action: {_, _ in self.changeSelected(tabIndex: 3)})]
    }
    
    func isSelectedButtonEditTab(tabIndex: Int) -> Bool{
        return tabIndex == selectedTab
    }
    
    func editAction(tabType: Binding<TabType>, tabs: inout [TabBarItemModel]) {
        switch tabType.wrappedValue {
        case .mainTab:
            print("Pressed Edit")
            tabType.wrappedValue = .editTab
            self.tabsInitial = tabs
            tabs = self.tabs
        case .editTab:
            print("Pressed Save")
            tabType.wrappedValue = .mainTab
            tabs = self.tabsInitial
        }
    }
    
    func changeSelected(tabs: inout [TabBarItemModel], tabType: inout TabType) { // back
        tabType = .mainTab
        tabs = self.tabsInitial
    }
    
    func changeSelected(tabIndex: Int) {
        selectedTab = tabIndex
        switch selectedTab {
        case 1: // delete
            notificationMessage = "The delete button was pressed."
            showNotification()
            list.remove(at: 0)
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
