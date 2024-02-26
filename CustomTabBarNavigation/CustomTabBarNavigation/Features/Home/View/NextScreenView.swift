//
//  NextScreenView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct NextScreenView: View {
    @Binding var isHiddenTabBar: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.white
            Color.pink.opacity(0.4)
            VStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isHiddenTabBar.toggle()
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
    NextScreenView(isHiddenTabBar: .constant(true))
}
