//
//  EditView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct HistoryView: View {
    @Binding var isEditMode: Bool
    var body: some View {
        ZStack {
            Color.white
            Color.green.opacity(0.3)
            VStack {
                Text("History")
                    .cardTextStyle(size: 30, weight: .bold, color: .black)
                if !isEditMode {
                    Text("Edit mode on")
                        .cardTextStyle(size: 17, weight: .light, color: .black)
                }
                
                Button(action: {
                    withAnimation{
                        isEditMode.toggle()
                    }
                }) {
                    HStack{
                        Text("Edit")
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
}

#Preview {
    HistoryView(isEditMode: .constant(false))
}
