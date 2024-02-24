//
//  TabItems.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home
    case search
    case edit
    case profile
    
    func toString() -> String {
        switch self {
        case .home:
            return "house.fill"
        case .search:
            return "magnifyingglass"
        case .edit:
            return "clock"
        case .profile:
            return "person.fill"
            
        }
    }
}

enum SecondTab: String, CaseIterable {
    case back
    case delete
    case unfavourite
    case favourite
    
    func toString() -> String {
        switch self {
        case .back:
            return "arrow.backward"
        case .delete:
            return "trash.fill"
        case .unfavourite:
            return "star.slash.fill"
        case .favourite:
            return "star.fill"
        }
    }
    
    func getColor() -> Color {
        switch self {
        case .delete:
            return .red
        default:
            return .gray
        }
    }
}
