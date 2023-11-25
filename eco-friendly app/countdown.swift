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

    var checkedDate: Int {
        return Calendar.current.dateComponents([.day], from: predeterminedDate, to: currentDate).day ?? 0
    }

    var body: some View {
        VStack {
            Text("Days Left: \(max(0, 14 - checkedDate))")
                .padding()
          
        }
        .onAppear {
            updateDaysLeft()
        }
    }

    func updateDaysLeft() {
        if checkedDate == 14 {
            daysLeft = 0
        } else if checkedDate < 14 {
            daysLeft = 14 - checkedDate
        }else{
            daysLeft = checkedDate - 14
        }
    }
}


