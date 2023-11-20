//
//  ContentView.swift
//  eco-friendly app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//
