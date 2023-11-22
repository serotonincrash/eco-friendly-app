//
//  CarbonFootprintResultView.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 22/11/23.
//

import SwiftUI

struct CarbonFootprintResultView: View {
    var totalCarbonFootprint: Double
    var airCarbonFootprint: Double
    var utilities: Double
    var selecteddate = Date()
    @EnvironmentObject var footprintManager: FootprintManager
    
    var body: some View {
        VStack {
            Text("Your total carbon footprint is \(String(format: "%.2f", totalCarbonFootprint))")
            Text("Your carbon footprint for air travel is \(String(format: "%.2f", airCarbonFootprint))")
            Text("Your carbon footprint for utilities is \(String(format: "%.2f", utilities))")
           
        }
        
        Button("Save") {
            footprintManager.footprints.append(Footprint(totalCarbonFootprint: totalCarbonFootprint, airCarbonFootprint: airCarbonFootprint, utilities: utilities, date: selecteddate))
        }
        .buttonStyle(CustomButtonStyle())
        
        NavigationLink(destination: CalculatorView()) {
            Text("Return to start")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}


