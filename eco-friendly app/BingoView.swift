import SwiftUI
import Forever

struct BingoView: View {
    @Forever("challenge") private var listOfChallenges: [Challenge] = []
    @State private var tappedIndex = 9
    @AppStorage("challengesCompleted") var challengesCompleted = 0
    @AppStorage("totalchallengesCompleted") var totalchallengesCompleted = 0
    @StateObject private var timerViewModel = TimerViewModel()
    @Forever("countdown") var countdown: Date = .now
    @Forever("lastDate") var lastUseDate: Date = Calendar.current.date(byAdding: .day, value: 14, to: .now) ?? Date()
    @State private var secondsLeft = 0
    @State private var minutesLeft = 0
    @State private var hoursLeft = 0
    @State private var daysLeft = 0
    @State private var currentChallenge: Challenge?

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

            VStack {
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
                            handleChallengeCompletion(selectedChallengeIndex: selectedChallengeIndex)
                            totalchallengesCompleted = Int(totalchallengesCompleted) + 1
                        } label: {
                            Text("Done!")
                                .padding()
                        }
                        .disabled(selectedChallenge.buttonClicked)
                        
                        ProgressView(value: selectedChallenge.progress)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        Text("\(Int(selectedChallenge.progress * 100))%")
                            .padding()
                        
                        Text("You have \(daysLeft) day(s), \(hoursLeft) hours, \(minutesLeft) minute(s) and \(secondsLeft) second(s) left")
                        Button("Return to start") {
                            tappedIndex = 9
                        }
                    }
                } else {
                    VStack {
                        if let currentChallenge = currentChallenge {
                            Text("Random Challenge:")
                                .bold()
                                .font(.title3)
                            Text(currentChallenge.challengeTitle)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                            Text(currentChallenge.challengeDescription)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                        } else {
                            Text("Please select one of the nine options given.")
                            Text("You have \(daysLeft) day(s), \(hoursLeft) hours, \(minutesLeft) minute(s) and \(secondsLeft) second(s) left")
                            
                            if challengesCompleted == listOfChallenges.count {
                                Button {
                                    resetChallenges()
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
        .onAppear {
            print(lastUseDate)
            lastUseDate = Date.now
            let dateDifference = Calendar.current.dateComponents([.day,.hour,.minute, .second], from: lastUseDate, to: countdown)
            let daysLeftInCountdown = dateDifference.day!
            let hoursLeftInCountdown = dateDifference.hour!
            let minutesLeftInCountdown = dateDifference.minute!
            let secondsLeftInCountdown = dateDifference.second!
            if secondsLeftInCountdown <= 0 {
                countdown = Calendar.current.date(byAdding: .day, value: 14, to: .now) ?? Date()
                resetChallenges()
                daysLeft = 13
                hoursLeft = 11
                minutesLeft = 59
                secondsLeft = 59
                return
            }
            daysLeft = daysLeftInCountdown
            hoursLeft = hoursLeftInCountdown
            minutesLeft = minutesLeftInCountdown
            secondsLeft = secondsLeftInCountdown
            print(countdown)
        }
    }

    func handleChallengeCompletion(selectedChallengeIndex: Int) {
        if !listOfChallenges[selectedChallengeIndex].completed {
            challengesCompleted += 1
        }
        listOfChallenges[selectedChallengeIndex].completed = true
        listOfChallenges[selectedChallengeIndex].progress = 1
        listOfChallenges[selectedChallengeIndex].buttonClicked = true

        timerViewModel.allowInteractionDate = .now.addingTimeInterval(timerViewModel.twoWeeksInSeconds)
    }

    func resetChallenges() {
        listOfChallenges = getChallenges()
    }
}

struct BingoView_Previews: PreviewProvider {
    static var previews: some View {
        BingoView()
    }
}
