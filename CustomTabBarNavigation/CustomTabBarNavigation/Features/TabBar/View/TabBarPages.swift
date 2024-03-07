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
    @State var offsetTabBar = 0.0
    @StateObject var tabVM: TabViewModel = .init()
   
    var body: some View {
        ZStack {
            manageView
            
            tabBar
        }
    }
    
    private var tabBar: some View {
        VStack {
            Spacer()
            if isHiddenTabBar {
                CustomTabBarVew(tabType: $tabType)
                    .environmentObject(tabVM)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .bottom),
                            removal: .move(edge: .bottom)
                        )
                    )
                    .offset(y: offsetTabBar)
            }
        }
        .padding(.horizontal, AppConstants.PaddingSize.paddingHorizontal)
    }
    
    private var manageView: some View {
        Group {
            switch tabVM.selectedTab {
            case 0: // home
                HomeView(isHiddenTabBar: $isHiddenTabBar, offsetTabBar: $offsetTabBar)
                
            case 1: // search
                SearchView()
                
            case 2: // history
                HistoryView(tabType: $tabType)
                    .environmentObject(tabVM)
                
            case 3: // profile
                ProfileView()
            default:
                Text("Error")
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
