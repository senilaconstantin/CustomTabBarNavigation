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
            case 0: // home
                HomeView(isHiddenTabBar: $isHiddenTabBar)
                
            case 1: // search
                SearchView()
                
            case 2: // history
                HistoryView(tabType: $tabType)
                    .environmentObject(historyVM)
                
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

#Preview {
    TabBarPages()
}
