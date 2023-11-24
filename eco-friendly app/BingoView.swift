//
//  BingoView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI
import Forever

struct BingoView: View {
    @Forever("challenge") private var listOfChallenges: [Challenge] = [
        Challenge(challengeIndex: 0, challengeTitle: "Achieve 90% Waste Diversion Rate", challengeDescription: "Strive to divert 90% of household waste from landfills through recycling, composting, and other sustainable practices.", progress: 0, completed: false, buttonClicked: false),
        Challenge(challengeIndex: 1, challengeTitle: "Reduce Single-Use Plastics by 50%", challengeDescription: "Set a goal to cut personal consumption of single-use plastics in half, measured by the quantity of plastic products used or purchased.", progress: 0, completed: false, buttonClicked: false),
        Challenge(challengeIndex: 2, challengeTitle: "Increase Recycling Participation to 95%", challengeDescription: "Aim to have 95% participation in recycling initiatives within your household or community, quantified by the number of individuals actively recycling.", progress: 0, completed: false, buttonClicked: false),
        Challenge(challengeIndex: 3, challengeTitle: "Compost 75% of Organic Waste", challengeDescription: "Establish a composting system and target the diversion of 75% of organic waste from landfills.", progress: 0, completed: false, buttonClicked: false),
        Challenge(challengeIndex: 4, challengeTitle: "Purchase 80% Recycled or Sustainable Products", challengeDescription: "Quantify efforts to support environmentally friendly products by setting a goal to purchase 80% of goods made from recycled materials or produced sustainably.", progress: 0, completed: false, buttonClicked: false),
        Challenge(challengeIndex: 5, challengeTitle: "Complete 10 Upcycling Projects Annually", challengeDescription: "Set a numerical target for upcycling projects completed each year, focusing on creatively repurposing materials.", progress: 0, completed: false, buttonClicked: false),
        Challenge(challengeIndex: 6, challengeTitle: "Reduce Water Usage by 20%", challengeDescription: "Measure and reduce water consumption by 20%, using water-saving technologies and mindful usage.", progress: 0, completed: false, buttonClicked: false),
        Challenge(challengeIndex: 7, challengeTitle: "Advocate to 100 Individuals Annually", challengeDescription: "Quantify the impact of educational advocacy by aiming to inform and influence 100 individuals each year about recycling and sustainable practices.", progress: 0, completed: false, buttonClicked: false),
        Challenge(challengeIndex: 8, challengeTitle: "Cut Carbon Emissions by 15%", challengeDescription: "Establish a numerical target to reduce personal carbon emissions by 15%, achieved through changes in transportation habits, energy use, and lifestyle choices.", progress: 0, completed: false, buttonClicked: false),
    ]
    
    @State private var tappedIndex = 0
    @AppStorage("challengesCompleted") var challengesCompleted = 0
    @StateObject private var timerViewModel = TimerViewModel()
    @Forever("now") var now = Date()
    @Forever("countdown")var futureDate = Calendar.current.date(byAdding: .day, value: 14, to: .now)!
    var components: DateComponents { Calendar.current.dateComponents([.day, .hour, .minute, .second], from: .now, to: futureDate)
    }

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
            if let selectedChallengeIndex = listOfChallenges.firstIndex(where: { $0.challengeIndex == tappedIndex }) {
                let selectedChallenge = listOfChallenges[selectedChallengeIndex]
                VStack {
                    Text(selectedChallenge.challengeTitle)
                        .bold()
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    Text(selectedChallenge.challengeDescription)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                    
                    Button {
                        if !selectedChallenge.completed {
                            challengesCompleted += 1
                        }
                        listOfChallenges[selectedChallengeIndex].completed = true
                        listOfChallenges[selectedChallengeIndex].progress = 1
                        listOfChallenges[selectedChallengeIndex].buttonClicked = true
                        
                        timerViewModel.allowInteractionDate = .now.addingTimeInterval(timerViewModel.twoWeeksInSeconds)
                    } label: {
                        Text("Done!")
                    }
                    .disabled(selectedChallenge.buttonClicked)
                    
                    ProgressView(value: selectedChallenge.progress)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding()
                    
                    Text("\(Int(selectedChallenge.progress * 100))%")
                        .padding()
                    
                    Text("You have \(components.day ?? 0) day(s), \(components.hour ?? 0) hour(s), and \(components.minute ?? 0) min(s) from now to complete all the challenges.")
                }
            } else {
                VStack {
                    Text("Please select one of the nine options given.")
                    
                    Text("You have \(components.day ?? 0)day(s), \(components.hour ?? 0)hour(s), and \(components.minute ?? 0)min(s) from now to complete all the challenges.")
                        .padding()
                        .foregroundColor(.gray)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.white, .yellow]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(10)
                    
                    if challengesCompleted == listOfChallenges.count {
                        Button {
                            listOfChallenges = listOfChallenges.compactMap { challenge in
                                var challenge = challenge
                                challenge.completed = false
                                challenge.progress = 0
                                challenge.buttonClicked = false
                                return challenge
                            }
                            challengesCompleted = 0
                        } label: {
                            Text("Reset challenges")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
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
