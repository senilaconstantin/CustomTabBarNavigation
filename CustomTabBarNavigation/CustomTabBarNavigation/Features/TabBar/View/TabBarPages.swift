//
//  TabBarPages.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct TabBarPages: View {
    @State var isEditMode: Bool = true
    @State var isPushNext: Bool = true
    @StateObject var tabVM: TabViewModel = .init()
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack {
            manageView
            
            VStack {
                Spacer()
                if isPushNext {
                    CustomTabBarVew(isEditMode: $isEditMode)
                        .environmentObject(tabVM)
                        .transition(.offset(y: 150))
                        
                }
            }
            .padding(.horizontal, 24)
        }
    }
    
    private var manageView: some View {
        TabView(selection: $tabVM.selectedTab) {
                HomeView(isPushNext: $isPushNext)
//                    .transition(.offset(x: AppConstants.ScreenSize.width * (-1)))
                    .tag(Tab.home)
                SearchView()
                    .tag(Tab.search)
                HistoryView(isEditMode: $isEditMode)
//                    .transition(.offset(x: AppConstants.ScreenSize.width))
                    .tag(Tab.edit)
                ProfileView()
                    .tag(Tab.profile)
            
        }
        .animation(.easeInOut(duration: 0.3), value: tabVM.selectedTab)
        .transition(.slide)
//        TabView(selection: $tabVM.selectedTab) {
//                HomeView(isPushNext: $isPushNext)
////                    .transition(.offset(x: AppConstants.ScreenSize.width * (-1)))
//                    .tag(Tab.home)
//                SearchView()
//                    .tag(Tab.search)
//                HistoryView(isEditMode: $isEditMode)
////                    .transition(.offset(x: AppConstants.ScreenSize.width))
//                    .tag(Tab.edit)
//                ProfileView()
//                    .tag(Tab.profile)
//            
//        }
    }
}

#Preview {
    TabBarPages()
}
