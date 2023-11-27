import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var footprintManager: FootprintManager

    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                    .frame(width: 300)
                NavigationLink(destination: ActualCalculatorView()) {
                    Image(systemName: "plus.circle")
                }
            }
            List {
                ForEach(footprintManager.footprints.reversed()) { footprint in
                    GeometryReader { geometry in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Date: \(footprint.date)")
                            Text("Total Carbon Footprint: \(footprint.totalCarbonFootprint)")
                            Text("Utilities: \(footprint.utilities)")
                            Text("Air Carbon Footprint: \(footprint.airCarbonFootprint)")
                        }
                        .padding()
                        .font(.footnote)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .yellow]),
                                startPoint: .leading,
                                endPoint: .bottomTrailing
                            )
                            .cornerRadius(10)
                        )
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .frame(maxWidth: geometry.size.width, minHeight: 100)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                    .frame(height: 100)
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(FootprintManager())
    }
}
