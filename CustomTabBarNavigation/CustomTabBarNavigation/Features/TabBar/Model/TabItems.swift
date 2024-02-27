//
//  TabItems.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

protocol TabItemConvertible: CaseIterable {
    func toString() -> String
    func getColor() -> Color
}

enum Tab: String, TabItemConvertible {
    case home
    case search
    case history
    case profile
    
    func toString() -> String {
        switch self {
        case .home:
            return "house.fill"
        case .search:
            return "magnifyingglass"
        case .history:
            return "clock"
        case .profile:
            return "person.fill"
            
        }
    }
    func getColor() -> Color {
        return .gray
    }
}

enum SecondTab: String, TabItemConvertible {
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
        case .favourite:
            return .yellow
        default:
            return .gray
        }
    }
}

struct GenericStruct<T: CaseIterable & Hashable & TabItemConvertible> {
    func getAllCases() -> [T] {
        return Array(T.allCases)
    }
}
