//
//  EditView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct HistoryView: View {
    @Binding var tabType: TabType
    @EnvironmentObject var historyVM: HistoryViewModel
    
    var body: some View {
        ZStack {
            Color.white
            Color.green.opacity(0.3)
            VStack {
                Text("History")
                    .cardTextStyle(size: 30, weight: .bold, color: .black)
                if historyVM.isEditMode(tabType: tabType) {
                    Text("Edit mode on")
                        .cardTextStyle(size: 17, weight: .light, color: .black)
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.4)){
                        historyVM.editAction(tabType: $tabType)
                    }
                }) {
                    ButtonAppView(titleButton: historyVM.getTitleButton(tabType: tabType))
                }
            }
        }
        .ignoresSafeArea()
        .overlay(
            VStack {
                NotificationView(message: historyVM.notificationMessage)
                    .opacity(historyVM.notificationVisible ? 1 : 0)
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
