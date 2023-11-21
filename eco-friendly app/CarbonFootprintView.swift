//
//  CarbonFootprintView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct CarbonFootprintView: View {
    
    @State var gasConsumption: Double
    @State var waterConsumption: Double
    @State var petrolConsumption: Double
    @State var hourOnAircraft: Double
    @State var minuteOnAircraft: Double
    @State var totalcarbonfootprint: Double
    
    @State var gasCarbonFootprint: Double
    @State var waterCarbonFootprint: Double
    @State var petrolCarbonFootprint:Double
    @State var airCarbonFootprint: Double
    
    
    
    var body: some View {
        print("Your carbon footprint is \(totalcarbonfootprint)")
    }
}

struct CarbonFootprintView_Previews: PreviewProvider {
    static var previews: some View {
        CarbonFootprintView()
    }
}
