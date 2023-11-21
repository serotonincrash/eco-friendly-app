import SwiftUI

struct CarbonFootprintView: View {
    @AppStorage("gasConsumption") var gasConsumption: Double = 0.0
    @AppStorage("waterConsumption") var waterConsumption: Double = 0.0
    @AppStorage("petrolConsumption") var petrolConsumption: Double = 0.0
    @AppStorage("hourOnAircraft") var hourOnAircraft: Double = 0.0
    @AppStorage("minuteOnAircraft") var minuteOnAircraft: Double = 0.0
    @State private var showResultView: Bool = false
    @State private var totalCarbonFootprint: Double = 0.0
    @AppStorage("lastCO2e") var lastCO2e = 0
    @AppStorage("Utilities") var utilities: Double = 0.0

    private var gasCarbonFootprint: Double { gasConsumption * 100 }
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
            NavigationStack {
                VStack {
                    Button("Calculate") {
                        calculateCarbonFootprint()
                        showResultView = true
                    }
                    .buttonStyle(CustomButtonStyle())

                    NavigationLink(
                        destination: CarbonFootprintResultView(totalCarbonFootprint: totalCarbonFootprint, airCarbonFootprint: airCarbonFootprint, utilities: utilities),
                        isActive: $showResultView
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
                .navigationBarTitle("Calculator")
            }
        }
    }
}

struct CarbonFootprintResultView: View {
    var totalCarbonFootprint: Double
    var airCarbonFootprint: Double
    var utilities: Double

    var body: some View {
        VStack {
            Text("Your total carbon footprint is \(String(format: "%.2f", totalCarbonFootprint))")
            Text("Your carbon footprint for air travel is \(String(format: "%.2f", airCarbonFootprint))")
            Text("Your carbon footprint for utilities is \(String(format: "%.2f", utilities))")
        }
        .navigationBarTitle("Result")
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

