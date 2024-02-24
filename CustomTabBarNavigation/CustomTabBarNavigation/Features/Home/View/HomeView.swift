//
//  HomeView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct HomeView: View {
    @Binding var isPushNext: Bool
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
                        NextScreenView(isPushNext: $isPushNext)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    isPushNext.toggle()
                                }
                            }
                    } label: {
                        HStack{
                            Text("Push Next")
                                .cardTextStyle(size: 17, weight: .light, color: .blue)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                        }
                        .background(Color.gray.opacity(0.7))
                        .cornerRadius(12)
                    }
                }
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView(isPushNext: .constant(true))
}
