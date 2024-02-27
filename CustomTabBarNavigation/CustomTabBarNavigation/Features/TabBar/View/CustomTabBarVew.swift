//
//  CustomTabBarVew.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct CustomTabBarVew: View {
    @EnvironmentObject var tabVM: TabViewModel
    @EnvironmentObject var historyVM: HistoryViewModel
    var body: some View {
        VStack {
            HStack {
                Spacer()
                switch historyVM.isPrincipalTab {
                case true:
                    mainTabBar
                case false:
                    editTabBar
                }
                Spacer()
            }
            .frame(height: 80)
            .background(.white)
            .cornerRadius (17)
        }
    }
    
    private var mainTabBar: some View {
        ForEach(Tab.allCases, id: \.rawValue) { tab in
            Spacer()
            Button(action: {
                withAnimation() {
                    tabVM.changeSelected(tab: tab)
                }
            }) {
                Image (systemName: tab.toString())
                    .tabButtonStyle(size: 24,
                                    scaleEffect: tabVM.isSelected(tab: tab) ? 1.1 : 1.0,
                                    color: tabVM.isSelected(tab: tab) ? .blue : .gray)
            }
            
            Spacer()
        }
        .transition(.offset(x: -AppConstants.ScreenSize.width + 50))
    }
    
    private var editTabBar: some View {
        ForEach(SecondTab.allCases, id: \.rawValue) { tab in
            Spacer()
            Button(action: {
                withAnimation(.easeIn(duration: 0.5)) {
                    historyVM.changeSelected(tab: tab)
                }
            }) {
                Image (systemName: tab.toString())
                    .tabButtonStyle(size: 24,
                                    scaleEffect: historyVM.isSelectedButtonEditTab(tab: tab) ? 1.1 : 1.0,
                                    color: tab.getColor())
            }
            
            Spacer()
        }
        .transition(.offset(x: AppConstants.ScreenSize.width - 50))
    }
    
}


//struct CustomTabBarVew: View {
//    @Binding var tabItems: [TabBarItem]
//
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//
//                mainTabBar
//
//                Spacer()
//            }
//            .frame(height: 80)
//            .background(.white)
//            .cornerRadius (17)
//        }
//    }
//
//    private var mainTabBar: some View {
//        ForEach(tabItems.indices, id: \.self) { index in
//            Spacer()
//            Button(action: tabItems[index].action) {
//                Image(systemName: tabItems[index].iconName)
//                    .tabButtonStyle(size: 24,
//                                    scaleEffect:  1.0,
//                                    color: .gray)
//            }
//            .tag(index)
//            Spacer()
//        }
//        .transition(.offset(x: -AppConstants.ScreenSize.width + 50))
////        ForEach(Tab.allCases, id: \.rawValue) { tab in
////            Spacer()
////            Button(action: {
////                withAnimation() {
////                    tabVM.changeSelected(tab: tab)
////                }
////            }) {
////                Image (systemName: tab.toString())
////                    .tabButtonStyle(size: 24,
////                                    scaleEffect: tabVM.isSelected(tab: tab) ? 1.1 : 1.0,
////                                    color: tabVM.isSelected(tab: tab) ? .blue : .gray)
////            }
////
////            Spacer()
////        }
//
//    }
//}
