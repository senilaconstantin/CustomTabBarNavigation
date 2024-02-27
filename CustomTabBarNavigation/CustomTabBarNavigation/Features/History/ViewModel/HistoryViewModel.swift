//
//  HistoryViewModel.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 27.02.2024.
//

import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var selectedEditTab: SecondTab
    @Published var isPrincipalTab: Bool
    
    @Published var notificationVisible: Bool = false
    var notificationMessage = ""
    
    init() {
        selectedEditTab = .back
        isPrincipalTab = true
    }
    
    func isSelectedButtonEditTab(tab: SecondTab) -> Bool{
        return tab == selectedEditTab
    }
    
    func editAction() {
        if isPrincipalTab {
            print("Pressed Edit")
        } else {
            print("Pressed Save")
        }
        isPrincipalTab.toggle()
    }
    
    func changeSelected(tab: SecondTab) {
        selectedEditTab = tab
        switch tab {
        case .back:
            isPrincipalTab.toggle()
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
