//
//  TabBarPages.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct TabBarPages: View {
    @State var isHiddenTabBar: Bool = true
    @State var tabType: TabType = .mainTab
    @StateObject var tabVM: TabViewModel = .init()
    @StateObject var historyVM: HistoryViewModel = .init()
    
    var body: some View {
        ZStack {
            manageView
            
            VStack {
                Spacer()
                if isHiddenTabBar {
                    CustomTabBarVew(tabType: $tabType)
                        .environmentObject(tabVM)
                        .environmentObject(historyVM)
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .bottom),
                                removal: .move(edge: .bottom)
                            )
                        )
                }
            }
            .padding(.horizontal, AppConstants.PaddingSize.paddingHorizontal)
        }
    }
    
    private var manageView: some View {
        Group {
            switch tabVM.selectedTab {
            case .home:
                HomeView(isHiddenTabBar: $isHiddenTabBar)
                
            case .search:
                SearchView()
                
            case .history:
                HistoryView(tabType: $tabType)
                    .environmentObject(historyVM)
                
            case .profile:
                ProfileView()
            }
        }
        .transition(
            .asymmetric(
                insertion: .move(edge: tabVM.isPushingFromLeft ? .trailing : .leading),
                removal: .move(edge: tabVM.isPushingFromLeft ? .leading : .trailing)
            )
        )
    }
}

#Preview {
    TabBarPages()
}
