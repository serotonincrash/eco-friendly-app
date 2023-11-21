//
//  Footprint.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 21/11/23.
//

import Foundation

struct Footprint: Identifiable, Codable {
    
    var id = UUID()
    var totalCarbonFootprint: Double
    var airCarbonFootprint: Double
    var utilities: Double
    
}
