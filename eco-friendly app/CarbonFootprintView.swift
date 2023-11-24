import SwiftUI

struct CarbonFootprintView: View {
    @AppStorage("gasConsumption") var gasConsumption: Double = 0.0
    @AppStorage("waterConsumption") var waterConsumption: Double = 0.0
    @AppStorage("petrolConsumption") var petrolConsumption: Double = 0.0
    @AppStorage("hourOnAircraft") var hourOnAircraft: Double = 0.0
    @AppStorage("minuteOnAircraft") var minuteOnAircraft: Double = 0.0
    @AppStorage("totalcarvonfootprint") var totalCarbonFootprint: Double = 0.0
    @AppStorage("lastCO2e") var lastCO2e = 0
    @State var selecteddate: Date = .now
    @State private var showResultView: Bool = false
    private var gasCarbonFootprint: Double { gasConsumption * 100 }
    private var waterCarbonFootprint: Double { waterConsumption * 50 }
    private var petrolCarbonFootprint: Double { petrolConsumption * 200 }
    private var airCarbonFootprint: Double { ((minuteOnAircraft / 60) + hourOnAircraft) * 90 }
    @State private var utilities: Double = 0.0
    private func calculateCarbonFootprint() {
        totalCarbonFootprint = gasCarbonFootprint + waterCarbonFootprint + petrolCarbonFootprint + airCarbonFootprint
        lastCO2e = Int(totalCarbonFootprint)
        utilities = gasCarbonFootprint + waterCarbonFootprint + petrolCarbonFootprint
    }

    var body: some View {
        NavigationView {
            NavigationStack {
                VStack {
                    DatePicker("Select a date", selection: $selecteddate, displayedComponents: .date)
                                       .datePickerStyle(WheelDatePickerStyle())
                                       .padding()

                                   Text("Selected Date: \(selecteddate)")
                                       .padding()
                               }
                               .navigationTitle("Date and Time Example")
                    Button("Calculate") {
                        calculateCarbonFootprint()
                        showResultView = true
                    }
                    .buttonStyle(CustomButtonStyle())
                    NavigationLink(
                        destination: CarbonFootprintResultView(totalCarbonFootprint: totalCarbonFootprint, airCarbonFootprint: airCarbonFootprint, utilities: utilities, selectedDate: selecteddate),
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


