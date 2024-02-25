//
//  CustomTabBarVew.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct CustomTabBarVew: View {
    @Binding var isEditMode: Bool
    @EnvironmentObject var tabVM: TabViewModel
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Spacer()
                    if isEditMode {
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
                    } else {
                        ForEach(SecondTab.allCases, id: \.rawValue) { tab in
                            Spacer()
                            Button(action: {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    tabVM.changeSelectedSecond(tab: tab)
                                }
                            }) {
                                Image (systemName: tab.toString())
                                    .tabButtonStyle(size: 24,
                                                    scaleEffect: tabVM.isSelectedSecond(tab: tab) ? 1.1 : 1.0,
                                                    color: tab.getColor())
                            }
                            
                            Spacer()
                        }
                        .transition(.offset(x: AppConstants.ScreenSize.width - 50))
                    }
                    
                    Spacer()
                }
                .frame(width: nil, height: 80)
                .background(.white) 
                .cornerRadius (17)
            }
        }
    }
}
