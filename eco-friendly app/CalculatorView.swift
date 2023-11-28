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
                    
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tittle: \(footprint.tittle)")
                                .font(.title)
                            Text("Date: \(footprint.date)")
                                .font(.footnote)
                            Text("Total Carbon Footprint: \(footprint.totalCarbonFootprint)")
                                .font(.footnote)
                            Text("Air Carbon Footprint: \(footprint.airCarbonFootprint)")
                                .font(.footnote)
                            Text("Utilities: \(footprint.utilities)")
                                .font(.footnote)
                            
                            
                        .padding()
                        .background(
                            
                            )
                            .cornerRadius(10)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                      
                    }
                    .frame(height: 150)
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
