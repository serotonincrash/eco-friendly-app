//
//  CountdownView.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 25/11/23.
//

import SwiftUI

struct CountdownView: View {
    @State private var currentDate = Date()
    @AppStorage("daysLeft") var daysLeft: Int = 0

    // Set your predetermined date here
    let predeterminedDate: Date = {
        var components = DateComponents()
        components.year = 2023
        components.month = 11
        components.day = 26
        components.hour = 0
        components.minute = 0
        components.second = 0
        return Calendar.current.date(from: components)!
    }()

    private var checkedDate: Int {
        Calendar.current.dateComponents([.day], from: currentDate, to: predeterminedDate).day ?? 0
    }

    private var daysLeftCalculated: Int {
        max(0, 14 - abs(checkedDate))
    }

    var body: some View {
        VStack {
            
            Text("Days Left: \(daysLeftCalculated)")
                .padding()
        }
        .onAppear {
            updateDaysLeft()
        }
    }

    private func updateDaysLeft() {
        daysLeft = daysLeftCalculated
    }
   
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
            .environmentObject(FootprintManager())
    }
}
