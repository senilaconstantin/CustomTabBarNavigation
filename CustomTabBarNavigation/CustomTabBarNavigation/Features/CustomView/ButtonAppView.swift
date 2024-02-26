//
//  ButtonView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 26.02.2024.
//

import SwiftUI

struct ButtonAppView: View {
    var titleButton: String
    var body: some View {
        HStack{
            Text(titleButton)
                .cardTextStyle(size: 17, weight: .light, color: .blue)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
    }
}

#Preview {
    ButtonAppView(titleButton: "Push Next")
}
