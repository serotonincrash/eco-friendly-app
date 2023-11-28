import SwiftUI

struct ActualCalculatorView: View {
    // Injected environment object
    @EnvironmentObject var footprintManager: FootprintManager
    
    // App storage properties
    @AppStorage("gasConsumption") var gasConsumption: Double = 0.0
    @AppStorage("waterConsumption") var waterConsumption: Double = 0.0
    @AppStorage("petrolConsumption") var petrolConsumption: Double = 0.0
    @AppStorage("hourOnAircraft") var hourOnAircraft: Double = 0.0
    @AppStorage("minuteOnAircraft") var minuteOnAircraft: Double = 0.0
    @AppStorage("totalcarvonfootprint") var totalCarbonFootprint: Double = 0.0
    @AppStorage("lastCO2e") var lastCO2e = 0
    @AppStorage("Utilities") var utilities: Double = 0.0
    @AppStorage("Tittle") var tittle = ""
    
    // Computed properties for carbon footprint
    private var gasCarbonFootprint: Double { gasConsumption * 100 }
    private var waterCarbonFootprint: Double { waterConsumption * 50 }
    private var petrolCarbonFootprint: Double { petrolConsumption * 200 }
    private var airCarbonFootprint: Double { ((minuteOnAircraft / 60) + hourOnAircraft) * 90 }
    
    // State property
    @State private var selectedDate = Date()
    @State private var showResultView: Bool = false
    
    // Function to calculate carbon footprint
    private func calculateCarbonFootprint() {
        totalCarbonFootprint = gasCarbonFootprint + waterCarbonFootprint + petrolCarbonFootprint + airCarbonFootprint
        lastCO2e = Int(totalCarbonFootprint)
        utilities = gasCarbonFootprint + waterCarbonFootprint + petrolCarbonFootprint
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Title Section
                Section("Title") {
                    HStack {
                        TextField("Input title.", text: $tittle)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    // Gas Consumption Section
                    Section("Monthly Gas Consumption") {
                        HStack {
                            TextField("Value from last year.", value: $gasConsumption, format: .number)
                                .multilineTextAlignment(.trailing)
                            Text("kilowatt-hour(s)").foregroundColor(.secondary)
                        }
                        
                        // Water Consumption Section
                        Section("Monthly Water Consumption") {
                            HStack {
                                TextField("Value from last year.", value: $waterConsumption, format: .number)
                                    .multilineTextAlignment(.trailing)
                                Text("cubic metre(s)").foregroundColor(.secondary)
                            }
                            
                            // Petrol Consumption Section
                            Section("Monthly Petrol Consumption") {
                                HStack {
                                    TextField("Value from last year.", value: $petrolConsumption, format: .number)
                                        .multilineTextAlignment(.trailing)
                                    Text("litre(s)").foregroundColor(.secondary)
                                }
                                
                                // Air Travel Section
                                Section("Time Travelling On Air") {
                                    HStack {
                                        TextField("Value from last year.", value: $hourOnAircraft, format: .number)
                                            .multilineTextAlignment(.trailing)
                                        Text("hour(s)").foregroundColor(.secondary)
                                        
                                        TextField("Value from last year.", value: $minuteOnAircraft, format: .number)
                                            .multilineTextAlignment(.trailing)
                                        Text("minute(s)").foregroundColor(.secondary)
                                        
                                        if minuteOnAircraft >= 60 {
                                            Text("Error: Minute(s) cannot exceed 60.").foregroundColor(.red)
                                        }
                                    }
                                    
                                    // Navigation Link
                                    NavigationLink(destination: CarbonFootprintView()) {
                                        Text("Go to Carbon Footprint View")
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Color.blue)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

