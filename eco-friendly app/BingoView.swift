import SwiftUI
import Forever

struct BingoView: View {
    @Forever("challenge") private var listOfChallenges: [Challenge] = []

    @State private var tappedIndex = 9
    @AppStorage("challengesCompleted") var challengesCompleted = 0
    @AppStorage("totalchallengesCompleted") var totalchallengesCompleted = 0
    @StateObject private var timerViewModel = TimerViewModel()
    @Forever("countdown") var firstUseDate: Date = .now
    @State private var isSheetPresented = false
    @AppStorage("daysleftchecked") var totaldaysleft: Int = 0
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
                        handleChallengeCompletion(selectedChallengeIndex: selectedChallengeIndex)
                        totalchallengesCompleted = Int(totalchallengesCompleted) + 1
                    } label: {
                        Text("Done!")
                    }
                    .disabled(selectedChallenge.buttonClicked)

                    ProgressView(value: selectedChallenge.progress)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding()

                    Text("\(Int(selectedChallenge.progress * 100))%")
                        .padding()

                   
                        Text("Days Left: \(totaldaysleft)")
                            .padding()
                            .background(.yellow)
                    
                                    }
                Button("Return to start") {
                   tappedIndex = 9
                }
            } else {
                VStack {
                    Text("Please select one of the nine options given.")
                   
                    
                        Text("Days Left: \(totaldaysleft)")
                            .padding()
                            .background(.yellow)
                    

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
        .onAppear {
            // find out how many weeks have passed since firstUseDate
            let timeSinceStart = Date.now.timeIntervalSince(firstUseDate)
            
            let numberOfWeeks = Int(timeSinceStart / timerViewModel.twoWeeksInSeconds)
            
            let twoWeekPair = numberOfWeeks/2
            
            let challenges = challengesForTwoWeek(number: twoWeekPair)
            
            // are these new challenges DIFFERENT from listOfChallenges
            if challenges.first?.challengeTitle != listOfChallenges.first?.challengeTitle {
                // replace
                listOfChallenges = challenges
            }
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
        listOfChallenges = listOfChallenges.compactMap { challenge in
            var challenge = challenge
            challenge.completed = false
            challenge.progress = 0
            challenge.buttonClicked = false
            return challenge
        }
        challengesCompleted = 0
    }
}

struct BingoView_Previews: PreviewProvider {
    static var previews: some View {
        BingoView()
    }
}

