import SwiftUI

struct ActualCalculatorView: View {
    @EnvironmentObject var footprintManager: FootprintManager
    @AppStorage("gasConsumption") var gasConsumption: Double = 0.0
    @AppStorage("waterConsumption") var waterConsumption: Double = 0.0
    @AppStorage("petrolConsumption") var petrolConsumption: Double = 0.0
    @AppStorage("hourOnAircraft") var hourOnAircraft: Double = 0.0
    @AppStorage("minuteOnAircraft") var minuteOnAircraft: Double = 0.0
    @AppStorage("totalcarvonfootprint") var totalCarbonFootprint: Double = 0.0
    @AppStorage("lastCO2e") var lastCO2e = 0
    @AppStorage("Utilities") var utilities: Double = 0.0
    @State private var showResultView: Bool = false
    private var gasCarbonFootprint: Double { Double(gasConsumption * 100) }
    private var waterCarbonFootprint: Double { waterConsumption * 50 }
    private var petrolCarbonFootprint: Double { petrolConsumption * 200 }
    private var airCarbonFootprint: Double { ((minuteOnAircraft / 60) + hourOnAircraft) * 90 }
    @State private var selectedDate = Date()
    
    private func calculateCarbonFootprint() {
        totalCarbonFootprint = gasCarbonFootprint + waterCarbonFootprint + petrolCarbonFootprint + airCarbonFootprint
        lastCO2e = Int(totalCarbonFootprint)
        utilities = gasCarbonFootprint + waterCarbonFootprint + petrolCarbonFootprint
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Yearly Gas Consumption") {
                    HStack {
                        TextField("Value from last year.", value: $gasConsumption, format: .number)
                            .multilineTextAlignment(.trailing)
                        Text("kilowatt-hour(s)")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Yearly Water Consumption") {
                    HStack {
                        TextField("Value from last year.", value: $waterConsumption, format: .number)
                            .multilineTextAlignment(.trailing)
                        Text("cubic metre(s)")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Yearly Petrol Consumption") {
                    HStack {
                        TextField("Value from last year.", value: $petrolConsumption, format: .number)
                            .multilineTextAlignment(.trailing)
                        Text("litre(s)")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Time Travelling On Air") {
                    HStack {
                        TextField("Value from last year.", value: $hourOnAircraft, format: .number)
                            .multilineTextAlignment(.trailing)
                        Text("hour(s)")
                            .foregroundColor(.secondary)
                        
                        TextField("Value from last year.", value: $minuteOnAircraft, format: .number)
                            .multilineTextAlignment(.trailing)
                        Text("minute(s)")
                            .foregroundColor(.secondary)
                    }
                    
                    if minuteOnAircraft >= 60 {
                        Text("Error: Minute(s) cannot exceed 60.")
                            .foregroundColor(.red)
                    }
                }
                
                
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
