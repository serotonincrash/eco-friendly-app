//
//  BingoView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct BingoView: View {
    
    @State private var progressValue1: Float = 0
    @State private var progressValue2: Float = 0
    @State private var progressValue3: Float = 0
    @State private var progressValue4: Float = 0
    @State private var progressValue5: Float = 0
    @State private var progressValue6: Float = 0
    @State private var progressValue7: Float = 0
    @State private var progressValue8: Float = 0
    @State private var progressValue9: Float = 0
    @State private var tappedIndex: Int?
    @AppStorage("challenge1completed") var challenge1completed = false
    @AppStorage("challenge2completed") var challenge2completed = false
    @AppStorage("challenge3completed") var challenge3completed = false
    @AppStorage("challenge4completed") var challenge4completed = false
    @AppStorage("challenge5completed") var challenge5completed = false
    @AppStorage("challenge6completed") var challenge6completed = false
    @AppStorage("challenge7completed") var challenge7completed = false
    @AppStorage("challenge8completed") var challenge8completed = false
    @AppStorage("challenge9completed") var challenge9completed = false
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
                if tappedIndex == 0 {
                    VStack {
                        Text("Achieve 90% Waste Diversion Rate")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text("Strive to divert 90% of household waste from landfills through recycling, composting, and other sustainable practices.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Button {
                            challenge1completed = true
                            challengesCompleted += 1
                            progressValue1 = 1
                        } label: {
                            Text("Done!")
                        }
                        ProgressView(value: progressValue1)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding(.bottom , 20)
                        
                        // Display progress value
                        Text("\(Int(progressValue1 * 100))%")
                            .padding()
                    }
                } else if tappedIndex == 1 {
                    VStack {
                        Text("Reduce Single-Use Plastics by 50%")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text("Set a goal to cut personal consumption of single-use plastics in half, measured by the quantity of plastic products used or purchased.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                           
                        Button {
                            challenge2completed = true
                            challengesCompleted += 1
                            progressValue2 = 1
                        } label: {
                            Text("Done!")
                        }
                        ProgressView(value: progressValue2)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        // Display progress value
                        Text("\(Int(progressValue2 * 100))%")
                            .padding()
                    }
                } else if tappedIndex == 2 {
                    VStack {
                        Text("Increase Recycling Participation to 95%")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text("Aim to have 95% participation in recycling initiatives within your household or community, quantified by the number of individuals actively recycling.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Button {
                            challenge3completed = true
                            challengesCompleted += 1
                            progressValue3 = 1
                        } label: {
                            Text("Done!")
                        }
                        ProgressView(value: progressValue3)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        // Display progress value
                        Text("\(Int(progressValue3 * 100))%")
                            .padding()
                    }
                } else if tappedIndex == 3 {
                    VStack {
                        Text("Compost 75% of Organic Waste within 2 weeks")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text("Establish a composting system and target the diversion of 75% of organic waste from landfills.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                          
                        Button {
                            challenge4completed = true
                            challengesCompleted += 1
                            progressValue4 = 1
                        } label: {
                            Text("Done!")
                        }
                        ProgressView(value: progressValue4)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        // Display progress value
                        Text("\(Int(progressValue4 * 100))%")
                            .padding()
                    }
                } else if tappedIndex == 4 {
                    VStack {
                        Text("Purchase 80% Recycled or Sustainable Products for 2 weeks")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text("Quantify efforts to support environmentally friendly products by setting a goal to purchase 80% of goods made from recycled materials or produced sustainably.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Button {
                            challenge5completed = true
                            challengesCompleted += 1
                            progressValue5 = 1
                        } label: {
                            Text("Done!")
                        }
                        ProgressView(value: progressValue5)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        // Display progress value
                        Text("\(Int(progressValue5 * 100))%")
                            .padding()
                    }
                } else if tappedIndex == 5 {
                    VStack {
                        Text("Complete 1 Upcycling Projects in the next 2 weeks")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text("Set a numerical target for upcycling projects completed each year, focusing on creatively repurposing materials.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Button {
                            challenge6completed = true
                            challengesCompleted += 1
                            progressValue6 = 1
                        } label: {
                            Text("Done!")
                        }
                        ProgressView(value: progressValue6)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        // Display progress value
                        Text("\(Int(progressValue6 * 100))%")
                            .padding()
                    }
                } else if tappedIndex == 6 {
                    VStack {
                        Text("Reduce Water Usage by 20% in two weeks")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text("Measure and reduce water consumption by 20%, using water-saving technologies and mindful usage.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Button {
                            challenge7completed = true
                            challengesCompleted += 1
                            progressValue7 = 1
                        } label: {
                            Text("Done!")
                        }
                        ProgressView(value: progressValue7)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        // Display progress value
                        Text("\(Int(progressValue7 * 100))%")
                            .padding()
                    }
                } else if tappedIndex == 7 {
                    VStack {
                        Text("Advocate to 2 Individuals in the next 2 weeks")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text("Quantify the impact of educational advocacy by aiming to inform and influence 100 individuals each year about recycling and sustainable practices.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Button {
                            challenge8completed = true
                            challengesCompleted += 1
                            progressValue8 = 1
                        } label: {
                            Text("Done!")
                        }
                        ProgressView(value: progressValue8)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        // Display progress value
                        Text("\(Int(progressValue8 * 100))%")
                            .padding()
                    }
                } else if tappedIndex == 8 {
                    VStack {
                        Text("Cut Carbon Emissions by 15% in the next 2 weeks")
                            .bold()
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text("Establish a numerical target to reduce personal carbon emissions by 15%, achieved through changes in transportation habits, energy use, and lifestyle choices.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Button {
                            challenge9completed = true
                            challengesCompleted += 1
                            progressValue9 = 1
                        } label: {
                            Text("Done!")
                        }
                        ProgressView(value: progressValue9)
                            .progressViewStyle(LinearProgressViewStyle())
                            .padding()
                        
                        // Display progress value
                        Text("\(Int(progressValue9 * 100))%")
                            .padding()
                    }
                } else {
                    VStack {
                        Text("Please select one of the nine options given.")
                        
                        // Add a linear gradient to the background of the text
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
