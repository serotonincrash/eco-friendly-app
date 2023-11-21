//
//  DataManager.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 21/11/23.
//

import Foundation
import SwiftUI

class FootprintManager: ObservableObject {
    @Published var footprints: [Footprint] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "footprints.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFootprints = try? propertyListEncoder.encode(footprints)
        try? encodedFootprints?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedFootprintData = try? Data(contentsOf: archiveURL),
            let footprintsDecoded = try? propertyListDecoder.decode([Footprint].self, from: retrievedFootprintData) {
            footprints = footprintsDecoded
        }
    }
}
