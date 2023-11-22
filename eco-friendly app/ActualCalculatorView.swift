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
    private var gasCarbonFootprint: Double { Double(gasConsumption * 100);Double() }
    private var waterCarbonFootprint: Double { waterConsumption * 50 }
    private var petrolCarbonFootprint: Double { petrolConsumption * 200 }
    private var airCarbonFootprint: Double { ((minuteOnAircraft / 60) + hourOnAircraft) * 90 }

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
                        TextField("Value from last year.", text: Binding(
                            get: { "\(self.gasConsumption ?? 0)" },
                            set: { self.gasConsumption = Int($0) ?? 0 }
                        ))
                        .multilineTextAlignment(.trailing)
                        Text("kilowatt-hour(s)")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Yearly Water Consumption") {
                    HStack {
                        TextField("Value from last year.", text: Binding(
                            get: { "\(self.waterConsumption ?? 0)" },
                            set: { self.waterConsumption = Int($0) ?? 0 }
                        ))
                        .multilineTextAlignment(.trailing)
                        Text("cubic metre(s)")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Yearly Petrol Consumption") {
                    HStack {
                        TextField("Value from last year.", text: Binding(
                            get: { "\(self.petrolConsumption ?? 0)" },
                            set: { self.petrolConsumption = Int($0) ?? 0 }
                        ))
                        .multilineTextAlignment(.trailing)
                        Text("litre(s)")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Time Travelling On Air") {
                    HStack {
                        TextField("Value from last year.", text: Binding(
                            get: { "\(self.hourOnAircraft ?? 0)" },
                            set: { self.hourOnAircraft = Int($0) ?? 0 }
                        ))
                        .multilineTextAlignment(.trailing)
                        Text("hour(s)")
                            .foregroundColor(.secondary)
                        
                        TextField("Value from last year.", text: Binding(
                            get: { "\(self.minuteOnAircraft ?? 0)" },
                            set: { self.minuteOnAircraft = Int($0) ?? 0 }
                        ))
                        .multilineTextAlignment(.trailing)
                        Text("minute(s)")
                            .foregroundColor(.secondary)
                    }
                    
                    if let minuteOnAircraft = minuteOnAircraft, minuteOnAircraft >= 60 {
                        Text("Error: Minute(s) cannot exceed 60.")
                            .foregroundColor(.red)
                    }
                }
                
                Button("Calculate your carbon footprint.") {
                    
                    VStack {
                        Text("Your total carbon footprint is \(String(format: "%.2f", totalCarbonFootprint))")
                        Text("Your carbon footprint for air travel is \(String(format: "%.2f", airCarbonFootprint))")
                        Text("Your carbon footprint for utilities is \(String(format: "%.2f", utilities))")
                    }
                    Button("Save") {
                        footprintManager.footprints.append(Footprint(totalCarbonFootprint: totalCarbonFootprint, airCarbonFootprint: airCarbonFootprint, utilities: utilities))
                               }
                               .buttonStyle(CustomButtonStyle())
                           }
                       }
                }
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .center)
            }
                }

struct ActualCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActualCalculatorView()
    }
}
