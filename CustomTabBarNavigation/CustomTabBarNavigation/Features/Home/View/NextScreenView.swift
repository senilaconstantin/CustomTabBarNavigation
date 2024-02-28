//
//  NextScreenView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct NextScreenView: View {
    @Binding var isHiddenTabBar: Bool
    @Binding var offsetTabBar: Double
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.white
            Color.pink.opacity(0.4)
            VStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    withAnimation(.bouncy(duration: 0.4)) {
                        isHiddenTabBar.toggle()
                        offsetTabBar = -2
                    } completion: {
                        withAnimation {
                            offsetTabBar = 0
                        }
                    }
                }) {
                    ButtonAppView(titleButton: "Back")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NextScreenView(isHiddenTabBar: .constant(true), offsetTabBar: .constant(0))
}
