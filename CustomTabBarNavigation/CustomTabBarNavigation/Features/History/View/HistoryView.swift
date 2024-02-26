//
//  EditView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var tabVM: TabViewModel
    
    var body: some View {
        ZStack {
            Color.white
            Color.green.opacity(0.3)
            VStack {
                Text("History")
                    .cardTextStyle(size: 30, weight: .bold, color: .black)
                if !tabVM.isEditMode {
                    Text("Edit mode on")
                        .cardTextStyle(size: 17, weight: .light, color: .black)
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)){
                        tabVM.editAction()
                    }
                }) {
                    ButtonAppView(titleButton: tabVM.isEditMode ? "Edit" : "Save")
                }
            }
        }
        .ignoresSafeArea()
        .overlay(
            VStack {
                NotificationView(message: tabVM.notificationMessage)
                    .opacity(tabVM.notificationVisible ? 1 : 0)
                Spacer()
            }
                .padding(.horizontal, AppConstants.PaddingSize.paddingHorizontal)
        )
    }
}

struct NotificationView: View {
    var message: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(message)
                .padding()
            Spacer()
        }
        .background(.thinMaterial)
        .cornerRadius(8)
    }
}
