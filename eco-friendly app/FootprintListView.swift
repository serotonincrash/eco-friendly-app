import SwiftUI

struct FootprintListView: View {
    @EnvironmentObject var footprintManager: FootprintManager
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy hh:mm"
        return formatter
    }
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    var body: some View {
        NavigationStack {
            List {
                if footprintManager.footprints.count != 0 {
                    ForEach(footprintManager.footprints.reversed()) { footprint in
                        NavigationLink(destination: FootprintDetailView(footprint: footprint), label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("\(dateFormatter.string(from: footprint.date))")
                                        .font(.footnote)
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text(numberFormatter.string(from: NSNumber(floatLiteral: footprint.totalCarbonFootprint))! + " kg")
                                }
                                // Make a information page + DELETE
                            
                            }
                        })
                            .environmentObject(footprintManager)
                        
                    }
                } else {
                    Text("You don't have any calculations :(")
                }
            }
            .navigationTitle("Carbon Footprints")
            .toolbar {
                ToolbarItemGroup(placement: .automatic) {
                    
                    NavigationLink(destination: CreateCalculationView()) {
                        Image(systemName: "plus.circle")
                    }
                    
                    
                }
            }
            .navigationBarBackButtonHidden()
        }
        
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        FootprintListView()
            .environmentObject(FootprintManager())
    }
}
