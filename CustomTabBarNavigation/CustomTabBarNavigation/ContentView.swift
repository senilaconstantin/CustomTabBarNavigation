//
//  ContentView.swift
//  CustomTabBarNavigation
//
//  Created by Constantin Senila on 23.02.2024.
//

import SwiftUI

struct ContentView: View {
    //    @StateObject var tabVM: TabViewModel = .init()
    @State var isOne: Bool = true
    @State var isTwo: Bool = true
    var body: some View {
        ZStack {
            Color.blue
            VStack {
                Spacer()
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.red)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isOne.toggle()
                        }
                    }
                Text("Hello, world!")
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.red)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isTwo.toggle()
                        }
                    }
                Spacer()
            }
            VStack {
                Spacer()
                
                if isTwo {
                    CustomTabBarVew()
                        .transition(.offset(y: 100))
                }
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
