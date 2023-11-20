//
//  ActualCalculatorView.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 20/11/23.
//

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
        }
    }
}
        
struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
