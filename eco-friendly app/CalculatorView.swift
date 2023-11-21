//
//  CalculatorView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var footprintManager: FootprintManager
    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                    .frame(width: 300)
                NavigationLink(destination: ActualCalculatorView()) {
                    Image(systemName: "plus.circle")
                }
            }
            List {
                ForEach(footprintManager.footprints) { footprint in
                    Text("")
                    Text("Total Carbon Footprint: \(footprint.totalCarbonFootprint)")
                    Text("Utilities: \(footprint.utilities)")
                    Text("Air Carbon Footprint: \(footprint.airCarbonFootprint)")
                    Text("Date: \(footprint.date)")
                }
            }
        }
    }
    
    struct CalculatorView_Previews: PreviewProvider {
        static var previews: some View {
            CalculatorView()
                .environmentObject(FootprintManager())
        }
    }
}
