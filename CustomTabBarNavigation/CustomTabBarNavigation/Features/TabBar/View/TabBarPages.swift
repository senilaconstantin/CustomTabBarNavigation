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
                    CustomTabBarVew()
                        .environmentObject(tabVM)
                        .transition(.offset(y: 150))
                }
            }
            .padding(.horizontal, AppConstants.PaddingSize.paddingHorizontal)
        }
    }
    
    private var manageView: some View {
        Group {
            switch tabVM.selectedTab {
            case .home:
                HomeView(isPushNext: $isPushNext)
                
            case .search:
                SearchView()
                
            case .history:
                HistoryView()
                    .environmentObject(tabVM)
                
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