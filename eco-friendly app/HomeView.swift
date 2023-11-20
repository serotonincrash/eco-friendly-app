//
//  HomeView.swift
//  eco-friendly app
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @AppStorage("bobuc") var bobuc = 0
    @AppStorage("challengesCompleted") var challengesCompleted = 0
    @AppStorage("lastCO2e") var lastCO2e = 0
    
    var body: some View {
        VStack {
            Text("Tip Of The Day: Use public transport.")
//                .foregroundColor(.green)
                .font(.title3)
                .bold()
                .padding(15)
            Text("Calculate your latest carbon emissions!")
//                .foregroundColor(.red)
                .font(.title2)
            Text("Last result: \(lastCO2e) kg CO2e")
//                .foregroundColor(.red)
                .font(.title2)
//            Spacer()
//                .frame(height: 450)
//            Circle()
//                .foregroundColor(.green)
//                .frame(width: 120)
//                .padding(50)
//            HStack{
//                Circle()
//                    .foregroundColor(.green)
//                    .frame(width: 120)
//                    .padding(-5)
//                Circle()
//                    .foregroundColor(.green)
//                    .frame(width: 120)
//                    .padding(-5)
//            }
//            .padding(-100)
//            Rectangle()
//                .foregroundColor(.brown)
//                .frame(width: 69, height: 200)
//                .padding(-35)
//            Text("You have \(bobuc) Bobucs")
                .font(.title)
//                .padding(35)
                .padding(5)
            Text("Number of challenges completed: \(challengesCompleted)/8")
                .font(.title2)
//                .padding(-30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
