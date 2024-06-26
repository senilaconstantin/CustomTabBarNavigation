//
//  CustomTabBarVew.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct CustomTabBarVew: View {
    @Binding var tabType: TabType
    @EnvironmentObject var tabVM: TabViewModel

    var body: some View {
        VStack {
            HStack {
                Spacer()
                switch tabType {
                case .mainTab:
                    buttonsTabBar
                        .transition(.offset(x: -AppConstants.ScreenSize.width + 75))
                case .editTab:
                    buttonsTabBar
                        .transition(.offset(x: AppConstants.ScreenSize.width - 75))
                }
                Spacer()
            }
            .frame(height: 80)
            .background(.white)
            .cornerRadius (17)
        }
    }
    
    private var buttonsTabBar: some View {
        ForEach(tabVM.tabs.indices, id: \.self) { index in
            Spacer()
            Button(action: {
                withAnimation(.easeIn(duration: 0.5)) {
                    tabVM.tabs[index].action(&tabVM.tabs, &tabType)
                }
            }) {
                Image (systemName: tabVM.tabs[index].iconName)
                    .tabButtonStyle(size: 24,
                                    scaleEffect: tabVM.isSelected(tabIndex: index) ? 1.07 : 1.0,
                                    color: tabVM.getColor(index: index, tabType: tabType))
            }
            
            Spacer()
        }
    }
    
    //    private var mainTabBar: some View {
    //        ForEach(tabVM.tabs.indices, id: \.self) { index in
    //            Spacer()
    //            Button(action: {
    //                withAnimation() {
    //                    tabVM.changeSelected(tabIndex: index)
    //                }
    //            }) {
    //                Image (systemName: tabVM.tabs[index].iconName)
    //                    .tabButtonStyle(size: 24,
    //                                    scaleEffect: tabVM.isSelected(tabIndex: index) ? 1.07 : 1.0,
    //                                    color: tabVM.isSelected(tabIndex: index) ? .blue : tabVM.tabs[index].color)
    //            }
    //
    //            Spacer()
    //        }
    //        .transition(.offset(x: -AppConstants.ScreenSize.width + 75))
    //    }
}
