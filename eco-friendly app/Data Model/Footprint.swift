//
//  Footprint.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 21/11/23.
//

import Foundation

struct Footprint: Identifiable, Codable {
    
    var id = UUID()
    var totalCarbonFootprint: Double {
        utilities + airCarbonFootprint
    }
    
    var hoursInAir: Double
    var minutesInAir: Double

    var gasConsumption: Double
    var waterConsumption: Double
    var petrolConsumption: Double
    var utilities: Double {
        gasCarbonFootprint + waterCarbonFootprint + petrolCarbonFootprint + airCarbonFootprint
    }
    
    // Computed properties for carbon footprint
    private var gasCarbonFootprint: Double { gasConsumption * 100 }
    private var waterCarbonFootprint: Double { waterConsumption * 50 }
    private var petrolCarbonFootprint: Double { petrolConsumption * 200 }
    private var airCarbonFootprint: Double { ((minutesInAir / 60) + hoursInAir) * 90 }
    
    var date: Date
    
}
