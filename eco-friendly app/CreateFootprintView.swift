import SwiftUI

struct CreateCalculationView: View {
    // Injected environment object
    @EnvironmentObject var footprintManager: FootprintManager
    @Environment(\.dismiss) var dismiss
    
    // App storage properties
    @State var gasConsumption: Double = 0.0
    @State var waterConsumption: Double = 0.0
    @State var petrolConsumption: Double = 0.0
    @State var hourOnAircraft: Double = 0.0
    @State var minuteOnAircraft: Double = 0.0
    @State var totalCarbonFootprint: Double = 0.0
    @State var lastCO2e = 0
    @State var utilities: Double = 0.0
    @State var title = ""
    
    private let numberFormat = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.zeroSymbol = ""
        return numberFormatter
    }()
    
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
        Form {
            
            // Gas Consumption Section
            Section() {
                VStack(alignment: .trailing) {
                    HStack {
                        TextField("0", value: $gasConsumption, formatter: numberFormat)
                            .multilineTextAlignment(.trailing)
                        Text("ℓ").foregroundColor(.secondary)
                    }
                }
            } header: {
                Text("Monthly Gas Consumption")
            } footer: {
                Text("Gas consumption from stoves, ovens, etc.")
                    .multilineTextAlignment(.trailing)
            }
            
            // Water Consumption Section
            Section() {
                VStack(alignment: .trailing) {
                    HStack {
                        TextField("0", value: $waterConsumption, formatter: numberFormat)
                            .multilineTextAlignment(.trailing)
                        Text("ℓ").foregroundColor(.secondary)
                    }
                }
                
            } header: {
                Text("Monthly Water Consumption")
            } footer: {
                Text("Your latest water consumption")
            }
            
            
            // Petrol Consumption Section
            Section() {
                HStack {
                    TextField("0", value: $petrolConsumption, formatter: numberFormat)
                        .multilineTextAlignment(.trailing)
                    Text("ℓ").foregroundColor(.secondary)
                }
            } header: {
                Text("Monthly Petrol Consumption")
            } footer: {
                Text("Petrol consumption of vehicles")
            }
            // Air Travel Section
            Section() {
                HStack {
                    HStack  {
                        TextField("0", value: $hourOnAircraft, formatter: numberFormat)
                            .multilineTextAlignment(.trailing)
                        Text("h").foregroundColor(.secondary)
                        
                    }
                    HStack {
                        TextField("0", value: $minuteOnAircraft, formatter: numberFormat)
                            .multilineTextAlignment(.trailing)
                        Text("min").foregroundColor(.secondary)
                    }
                    
                }
            } header: {
                Text("Time travelled via plane")
            } footer: {
                Text("Amount of time spent in the air")
            }
            
            // Navigation Link
            Button("Save Result") {
                let calculation = Footprint(hoursInAir: hourOnAircraft, minutesInAir: minuteOnAircraft, gasConsumption: gasConsumption, waterConsumption: waterConsumption, petrolConsumption: petrolConsumption, date: Date())
                footprintManager.footprints.append(calculation)
                dismiss()
            }
        }
        .navigationTitle("Create New Footprint")
    }
    
}
