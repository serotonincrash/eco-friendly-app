//
//  eco_friendly_appApp.swift
//  eco-friendly app
//
//  Created by T Krobot on 20/11/23.
//

import SwiftUI

@main
struct eco_friendly_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FootprintManager())
        }
    }
}
