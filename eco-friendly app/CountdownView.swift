//
//  CountdownView.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 28/11/23.
//


import SwiftUI

struct CountdownView: View {
    @State private var remainingSeconds = 14 * 24 * 60 * 60 // 2 weeks in seconds
    @State private var timer: Timer?
    @AppStorage("Timeleft") var timeLeft = 0
    @State private var currentDate = Date()

    var body: some View {
        Group {
            VStack {
                Text("Hours left")
                    .font(.title)

                Text(formatTime(remainingSeconds))
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: BingoView()) {
                    Text("Return to Challenges")
                }
            }
            .onAppear {
                remainingSeconds = max(0, timeLeft - Int(Date().timeIntervalSince(currentDate)))
                startTimer()
            }
            .onDisappear {
                stopTimer()
                timeLeft = remainingSeconds
            }
            
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                stopTimer()
                Text("You are out of time")
                remainingSeconds = 14 * 24 * 60 * 60
            }
        }
        RunLoop.current.add(timer!, forMode: .common)
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func formatTime(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
