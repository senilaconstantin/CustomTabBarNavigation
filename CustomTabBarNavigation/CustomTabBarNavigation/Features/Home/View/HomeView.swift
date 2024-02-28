//
//  HomeView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct HomeView: View {
    @Binding var isHiddenTabBar: Bool
    @Binding var offsetTabBar: Double
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                Color.purple.opacity(0.5)
                
                VStack {
                    Text("Home")
                        .cardTextStyle(size: 30, weight: .bold, color: .black)
                        .padding([.top], 15)
                    
                    NavigationLink {
                        NextScreenView(isHiddenTabBar: $isHiddenTabBar,
                                       offsetTabBar: $offsetTabBar)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    isHiddenTabBar.toggle()
                                }
                            }
                    } label: {
                        ButtonAppView(titleButton: "Push Next")
                    }
                }
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView(isHiddenTabBar: .constant(true), offsetTabBar: .constant(0))
}
