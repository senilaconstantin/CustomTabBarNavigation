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
                                    .foregroundColor(tabVM.isSelected(tab: tab) ? .blue : .gray)
                                    .scaleEffect (tabVM.isSelected(tab: tab) ? 1.1 : 1.0)
                                    .font(.system(size: 24))
                            }
                            
                            Spacer()
                        }
                        .transition(.offset(x: AppConstants.ScreenSize.width * (-1)))
                    } else {
                        ForEach(SecondTab.allCases, id: \.rawValue) { tab in
                            Spacer()
                            Button(action: {
                                withAnimation(.easeIn(duration: 0.1)) {
                                    tabVM.changeSelectedSecond(tab: tab)
                                }
                            }) {
                                Image (systemName: tab.toString())
                                    .font(.system(size: 24))
                                    .foregroundColor(tabVM.isSelectedSecond(tab: tab) ? .blue : tab.getColor())
                                    .scaleEffect (tabVM.isSelectedSecond(tab: tab) ? 1.1 : 1.0)
                                    
                                
                            }
                            
                            Spacer()
                        }
                        .transition(.offset(x: AppConstants.ScreenSize.width))
                    }
                    
                    Spacer()
                }
                .frame(width: nil, height: 80)
                .background(.white) // .thinMaterial
                .cornerRadius (17)
            }
        }
    }
}


//#Preview {
//    CustomTabBarVew(isOne: .constant(true))
//}
