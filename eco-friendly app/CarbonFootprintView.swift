//
//  CarbonFootprintView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct CarbonFootprintView: View {
    
    @State var gasConsumption: Int?
    @State var waterConsumption: Int?
    @State var petrolConsumption: Int?
    @State var hourOnAircraft: Int?
    @State var minuteOnAircraft: Int?
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct CarbonFootprintView_Previews: PreviewProvider {
    static var previews: some View {
        CarbonFootprintView()
    }
}
