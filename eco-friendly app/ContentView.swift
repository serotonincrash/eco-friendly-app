//
//  ContentView.swift
//  eco-friendly app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            BingoView()
                .tabItem {
                    Label("Bingo", systemImage: "tablecells")
                }
            FootprintListView()
                .tabItem {
                    Label("Calculator", systemImage: "123.rectangle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FootprintManager())
    }
}
