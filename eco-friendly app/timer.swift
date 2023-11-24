//
//  timer.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 22/11/23.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var elapsedTime: TimeInterval = 0
    private var timer: Timer?
    let twoWeeksInSeconds: TimeInterval = 2 * 7 * 24 * 60 * 60 // 2 weeks in seconds
    
    var allowInteractionDate: Date?

    init() {
        startTimer()
    }

    deinit {
        stopTimer()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.elapsedTime += 1
            if self.elapsedTime >= self.twoWeeksInSeconds {
                // Timer reached 2 weeks, stop the timer or perform any necessary action
                self.stopTimer()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
