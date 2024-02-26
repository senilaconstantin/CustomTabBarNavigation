//
//  NextScreenView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct NextScreenView: View {
    @Binding var isPushNext: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.orange
            VStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPushNext.toggle()
                    }
                }) {
                    HStack{
                        Text("Back")
                            .cardTextStyle(size: 17, weight: .light, color: .blue)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                    }
                    .background(Color.gray.opacity(0.7))
                    .cornerRadius(12)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NextScreenView(isPushNext: .constant(true))
}
