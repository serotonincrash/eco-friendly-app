//
//  BingoView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct BingoView: View {
    @State private var buttonClicked: [Bool] = Array(repeating: false, count: 9)
    @State private var progressValues: [Float] = Array(repeating: 0.0, count: 9)
    @State private var tappedIndex: Int?
    @AppStorage("challengesCompleted") var challengesCompleted = 0
    @StateObject private var timerViewModel = TimerViewModel()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 10) {
                ForEach(0..<9) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 80, height: 80)
                        .foregroundColor(tappedIndex == index ? .clear : .blue)
                        .overlay(
                            Text(tappedIndex == index ? "" : "\(index + 1)")
                                .foregroundColor(tappedIndex == index ? .clear : .white)
                                .font(.headline)
                        )
                        .onTapGesture {
                            tappedIndex = index
                        }
                }
            }
            .padding()
            
            VStack {
                if let tappedIndex = tappedIndex, tappedIndex >= 0 && tappedIndex < 9 {
                    let challengeIndex = tappedIndex + 1
                    let challengeCompletedKey = "challenge\(challengeIndex)completed"
                    let buttonClickedKey = "buttonClicked\(challengeIndex)"
                    let progressValueKey = "progressValue\(challengeIndex)"
                    
                    VStack {
                        // Display challenge details based on the tapped index
                        // ...
                        
                        Button {
                            // Set AppStorage and update buttonClicked and progressValues array
                            challengesCompleted += 1
                            buttonClicked[tappedIndex] = true
                            progressValues[tappedIndex] = 1.0
                            
                            // Save to AppStorage
                            UserDefaults.standard.set(true, forKey: challengeCompletedKey)
                            UserDefaults.standard.set(true, forKey: buttonClickedKey)
                            UserDefaults.standard.set(progressValues[tappedIndex], forKey: progressValueKey)
                            
                            // Update timer for interaction
                            timerViewModel.allowInteractionDate = .now.addingTimeInterval(timerViewModel.twoWeeksInSeconds)
                        } label: {
                            Text("Done!")
                        }
                        .disabled(buttonClicked[tappedIndex])
                        
                        ProgressView(value: progressValues[tappedIndex])
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        // Display progress value
                        Text("\(Int(progressValues[tappedIndex] * 100))%")
                            .padding()
                    }
                } else {
                    // Display a message for when no button is tapped
                    Text("Please select one of the nine options given.")
                    Text("Time Remaining: \(timeString(from: timerViewModel.twoWeeksInSeconds - timerViewModel.elapsedTime)) left for you to complete the challenges. Better hurry!")
                        .padding()
                        .foregroundColor(.gray)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.white, .yellow]), // You can change these colors
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(10) // Optional: Add corner radius for a rounded look
                }
            }
        }
    }
    func timeString(from time: TimeInterval) -> String {
        let days = Int(time) / (3600 * 24)
        let hours = (Int(time) % (3600 * 24)) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60
        
        var timeComponents: [String] = []
        
        if days > 0 {
            timeComponents.append("\(days) \(days == 1 ? "day" : "days")")
        }
        if hours > 0 {
            timeComponents.append("\(hours) \(hours == 1 ? "hour" : "hours")")
        }
        if minutes > 0 {
            timeComponents.append("\(minutes) \(minutes == 1 ? "minute" : "minutes")")
        }
        if seconds > 0 {
            timeComponents.append("\(seconds) \(seconds == 1 ? "second" : "seconds")")
        }
        
        return timeComponents.joined(separator: ", ")
    }
    
    
    struct BingoView_Previews: PreviewProvider {
        static var previews: some View {
            BingoView()
        }
    }
}

