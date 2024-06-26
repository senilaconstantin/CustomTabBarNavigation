//
//  SearchView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 24.02.2024.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            Color.white
            Color.blue.opacity(0.3)
            VStack {
                Text("Search")
                    .cardTextStyle(size: 30, weight: .bold, color: .black)
                    .padding([.top], 15)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SearchView()
}
