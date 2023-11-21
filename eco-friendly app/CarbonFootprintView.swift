import SwiftUI

struct CarbonFootprintView: View {
    @AppStorage("gasConsumption") var gasConsumption: Double = 0.0
    @AppStorage("waterConsumption") var waterConsumption: Double = 0.0
    @AppStorage("petrolConsumption") var petrolConsumption: Double = 0.0
    @AppStorage("hourOnAircraft") var hourOnAircraft: Double = 0.0
    @AppStorage("minuteOnAircraft") var minuteOnAircraft: Double = 0.0
    @State private var showResultView: Bool = false
    @State private var totalCarbonFootprint: Double = 0.0

    private var gasCarbonFootprint: Double { Double((gasConsumption ) * 100) }
    private var waterCarbonFootprint: Double { Double(waterConsumption ) * 50 }
    private var petrolCarbonFootprint: Double { Double(petrolConsumption ) * 200 }
    private var airCarbonFootprint: Double { ((Double(minuteOnAircraft ) / 60) + Double(hourOnAircraft )) * 90 }

    private func calculateCarbonFootprint() {
        totalCarbonFootprint = gasCarbonFootprint + waterCarbonFootprint + petrolCarbonFootprint + airCarbonFootprint
    }


    var body: some View {
        NavigationView {
            NavigationStack {
                VStack {
                    // Your user interface components here

                    Button("Calculate") {
                        calculateCarbonFootprint()
                        showResultView = true
                    }
                    .buttonStyle(CustomButtonStyle())

                    NavigationLink(
                        destination: CarbonFootprintResultView(totalCarbonFootprint: totalCarbonFootprint),
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

    var body: some View {
        VStack {
            Text("Your carbon footprint is \(totalCarbonFootprint)")
            // Add other content or UI elements as needed
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

