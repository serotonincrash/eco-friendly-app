//
//  FootprintDetailView.swift
//  eco-friendly app
//
//  Created by Sean Wong on 16/12/23.
//

import SwiftUI

struct FootprintDetailView: View {
    @State var footprint: Footprint
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
        VStack {
            List {
                Section {
                    VStack {
                        HStack {
                            Text("Date")
                            Spacer()
                            Text(dateFormatter.string(from: footprint.date))
                                .font(.subheadline)
                        }
                    }
                    VStack {
                        HStack {
                            Text("Overall Carbon Footprint")
                            Spacer()
                            Text("\(numberFormatter.string(from: NSNumber(value: footprint.totalCarbonFootprint))!) kg")
                                .font(.subheadline)
                        }
                    }
                } header: {
                    Text("Information")
                }
                
                Section {
                    VStack {
                        HStack {
                            Text("Gas Consumption")
                            Spacer()
                            Text("\(numberFormatter.string(from: NSNumber(value: footprint.gasConsumption))!) kg")
                                .font(.subheadline)
                        }
                    }
                    VStack {
                        HStack {
                            Text("Water Consumption")
                            Spacer()
                            Text("\(numberFormatter.string(from: NSNumber(value: footprint.waterConsumption))!) kg")
                                .font(.subheadline)
                        }
                    }
                    VStack {
                        HStack {
                            Text("Petrol Consumption")
                            Spacer()
                            Text("\(numberFormatter.string(from: NSNumber(value: footprint.petrolConsumption))!) kg")
                                .font(.subheadline)
                        }
                    }
                    VStack {
                        HStack {
                            Text("Time Spent on Flights")
                            Spacer()
                            Text("\(numberFormatter.string(from: NSNumber(value: footprint.hoursInAir))!) h \(numberFormatter.string(from: NSNumber(value: footprint.minutesInAir))!) min")
                                .font(.subheadline)
                        }
                    }
                } header: {
                    Text("Consumptions")
                }

            }
        }
        .navigationTitle("Footprint Information")
        
    }
}

#Preview {
    NavigationStack {
        FootprintDetailView(footprint: Footprint(hoursInAir: 2, minutesInAir: 30, gasConsumption: 25, waterConsumption: 10, petrolConsumption: 30, date: Date()))
    }
}
