//
//  CustomTabBarVew.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct CustomTabBarVew: View {
    @EnvironmentObject var tabVM: TabViewModel
    var body: some View {
        VStack {
            HStack {
                Spacer()
                switch tabVM.isPrincipalTab {
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
                    tabVM.changeSelectedSecond(tab: tab)
                }
            }) {
                Image (systemName: tab.toString())
                    .tabButtonStyle(size: 24,
                                    scaleEffect: tabVM.isSelectedButtonEditTab(tab: tab) ? 1.1 : 1.0,
                                    color: tab.getColor())
            }
            
            Spacer()
        }
        .transition(.offset(x: AppConstants.ScreenSize.width - 50))
    }
    
}
