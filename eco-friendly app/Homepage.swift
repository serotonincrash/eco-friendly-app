//
//  HomeView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("bobuc") var bobuc = 0
    @AppStorage("challengesCompleted") var challengesCompleted = 0
    @AppStorage("lastCO2e") var lastCO2e = 0
    
    var body: some View {
        VStack {
            Text("Tip Of The Day: Use public transport.")
                .font(.title3)
                .bold()
                .padding(15)
            Text("Calculate your latest carbon emissions!")
                .font(.title2)
            Text("Last result: \(lastCO2e) kg CO2e")
                .font(.title2)
                .padding(5)
            Text("Number of challenges completed: \(challengesCompleted)/8")
                .font(.title2)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
