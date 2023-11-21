//
//  CalculatorView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct ActualCalculatorView: View {
    
    @State var gasConsumption: Int?
    @State var waterConsumption: Int?
    @State var petrolConsumption: Int?
    @State var hourOnAircraft: Int?
    @State var minuteOnAircraft: Int?
    @State private var selectedOptionN = 0
    @State private var aluminiumAndTin = 0
    let options = ["Yes", "NO"]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Yearly Gas Consumption") {
                    HStack {
                        TextField("Value from last year.", text: Binding(
                            get: {"\(self.gasConsumption ?? 0)"},
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
                            get: {"\(self.waterConsumption ?? 0)"},
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
                            get: {"\(self.petrolConsumption ?? 0)"},
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
                    if minuteOnAircraft != nil {
                        if minuteOnAircraft! >= 60 {
                            Text("Error: Minute(s) cannot exceed 60.")
                                .foregroundColor(.red)
                        }
                    }
                }
                NavigationLink("Calculate your carbon footprint.") {
                    CarbonFootprintView()
                }
                .foregroundColor(.blue)
            }
        }
    }
}


struct ActualCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActualCalculatorView()
    }
}
