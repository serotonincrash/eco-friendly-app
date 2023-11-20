//
//  ActualCalculatorView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct ActualCalculatorView: View {
    @State var gasConsumption: String?
    @State var electricConsumption: String?
    @State var oilConsumption: String?
    @State var L4flights: String?
    @State var M4flights: String?
    @State private var selectedOptionN = 0
    @State private var aluminiumAndTin = 0
    let options = ["Yes", "NO"]
    
    @State var gasConsumption: Int?
    @State var waterConsumption: Int?
    @State var petrolConsumption: Int?
    @State var hourOnAircraft: Int?
    @State var minuteOnAircraft: Int?
    
    var body: some View {
        
        List {
            Text("Input monthly gas consumption:")
            TextField("Take your gas consumption last month.", text: Binding(
                get: { self.gasConsumption ?? "" },
                set: { self.gasConsumption = $0 }
            ))
            Text("Input monthly electric Consumption")
            TextField("Take your last month electric consumption", text: Binding(
                get: { self.electricConsumption ?? ""},
                set: { self.electricConsumption = $0}
            ))
            Text("Input monthly oil Consumption")
            TextField("Take your last month oil comsuption", text: Binding(
                get: { self.oilConsumption ?? ""},
                set: { self.oilConsumption = $0}
            ))
            Text("Input number of flights less than 4 hours you have tooken in the last year")
            TextField("Take the number of flights less than 4 hours in the past year", text: Binding(
                get: { self.L4flights ?? ""},
                set: { self.L4flights = $0}
            ))
            Text("Input number of flights 4 hours or more you have taken in the last year")
            TextField("Take the number of flights 4 hours or more in the past year", text: Binding(
                get: { self.M4flights ?? ""},
                set: { self.M4flights = $0}
            ))
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
                if minuteOnAircraft == 60 {
                    Text("Error: Minute(s) cannot exceed 60.")
                        .foregroundColor(.red)
                }
            }
            Section("Submit Form") {
                Button {
                    CarbonFootprintView()
                } label: {
                    Text("Calculate your carbon footprint.")
                }
            }
        }
        
    }
}
        
struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
struct ActualCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActualCalculatorView()
    }
}
