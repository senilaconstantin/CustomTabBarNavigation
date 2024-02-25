//
//  TabBarPages.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct TabBarPages: View {
    @State var isPushNext: Bool = true
    @StateObject var tabVM: TabViewModel = .init()
//    init() {
//        UITabBar.appearance().isHidden = true
//    }
    var body: some View {
        ZStack {
            manageView
            
            VStack {
                Spacer()
                if isPushNext {
                    CustomTabBarVew(isEditMode: $tabVM.isEditMode)
                        .environmentObject(tabVM)
                        .transition(.offset(y: 150))
                }
            }
            .padding(.horizontal, 24)
        }
    }
    
    private var manageView: some View {
        ZStack {
            HomeView(isPushNext: $isPushNext)
                .offset(x: tabVM.selectedTab == .search ? -AppConstants.ScreenSize.width : 0)
                .offset(x: tabVM.selectedTab == .history ? -AppConstants.ScreenSize.width : 0)
                .offset(x: tabVM.selectedTab == .profile ? -AppConstants.ScreenSize.width : 0)
                .opacity(tabVM.selectedTab == .home || tabVM.lastSelectedTab == .home ? 1 : 0)
            
            SearchView()
                .offset(x: tabVM.selectedTab == .home ? AppConstants.ScreenSize.width : 0)
                .offset(x: tabVM.selectedTab == .history ? -AppConstants.ScreenSize.width : 0)
                .offset(x: tabVM.selectedTab == .profile ? -AppConstants.ScreenSize.width : 0)
                .opacity(tabVM.selectedTab == .search || tabVM.lastSelectedTab == .search ? 1 : 0)
            
            
            HistoryView()
                .environmentObject(tabVM)
                .offset(x: tabVM.selectedTab == .home ? AppConstants.ScreenSize.width : 0)
                .offset(x: tabVM.selectedTab == .search ? AppConstants.ScreenSize.width : 0)
                .offset(x: tabVM.selectedTab == .profile ? -AppConstants.ScreenSize.width : 0)
                .opacity(tabVM.selectedTab == .history || tabVM.lastSelectedTab == .history ? 1 : 0)
            
            
            ProfileView()
                .offset(x: tabVM.selectedTab == .home ? AppConstants.ScreenSize.width : 0)
                .offset(x: tabVM.selectedTab == .search ? AppConstants.ScreenSize.width : 0)
                .offset(x: tabVM.selectedTab == .history ? AppConstants.ScreenSize.width : 0)
                .opacity(tabVM.selectedTab == .profile || tabVM.lastSelectedTab == .profile ? 1 : 0)
        }
    }
}

#Preview {
    TabBarPages()
}
