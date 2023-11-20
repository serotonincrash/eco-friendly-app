//
//  CalculatorView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct CalculatorView: View {
    
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
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

