import SwiftUI

struct CarbonFootprintResultView: View {
    var totalCarbonFootprint: Double
    var airCarbonFootprint: Double
    var utilities: Double
    var selectedDate = Date()
    var tittle: String
    
    @EnvironmentObject var footprintManager: FootprintManager
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("Tittle: \(tittle)")
            Text("Your total carbon footprint is \(String(format: "%.2f", totalCarbonFootprint))")
            Text("Your carbon footprint for air travel is \(String(format: "%.2f", airCarbonFootprint))")
            Text("Your carbon footprint for utilities is \(String(format: "%.2f", utilities))")
        }

        Button("Save") {
            showAlert = true
        }
        .buttonStyle(CustomButtonStyle())
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("You have saved your calculator results"),
                message: Text(""),
                primaryButton: .default(Text("Ok")) {
                    footprintManager.footprints.append(Footprint(
                        totalCarbonFootprint: totalCarbonFootprint,
                        airCarbonFootprint: airCarbonFootprint,
                        utilities: utilities,
                        date: selectedDate, 
                        tittle: tittle
                    ))
                },
                secondaryButton: .cancel()
            )
        }

        NavigationLink(destination: CalculatorView()) {
            Text("Return to start")
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}
