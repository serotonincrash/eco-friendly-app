//
//  BingoView.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 20/11/23.
//

import SwiftUI

struct BingoView: View {
    
    @State private var progressValue: Float = 0.5
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
            ZStack {
                if tappedIndex == 0 {
                    VStack {
                        Text("Achieve 90% Waste Diversion Rate")
                            .bold()
                        Text("Strive to divert 90% of household waste from landfills through recycling, composting, and other sustainable practices.")
                        Button {
                            challenge1completed = true
                            challengesCompleted += 1
                        } label: {
                            Text("Done!")
                        }
                    }
                } else if tappedIndex == 1 {
                    VStack {
                        Text("Reduce Single-Use Plastics by 50%")
                            .bold()
                        Text("Set a goal to cut personal consumption of single-use plastics in half, measured by the quantity of plastic products used or purchased.")
                        Button {
                            challenge2completed = true
                            challengesCompleted += 1
                        } label: {
                            Text("Done!")
                        }
                    }
                } else if tappedIndex == 2 {
                    VStack {
                        Text("Increase Recycling Participation to 95%")
                            .bold()
                        Text("Aim to have 95% participation in recycling initiatives within your household or community, quantified by the number of individuals actively recycling.")
                        Button {
                            challenge3completed = true
                            challengesCompleted += 1
                        } label: {
                            Text("Done!")
                        }
                    }
                } else if tappedIndex == 3 {
                    VStack {
                        Text("Compost 75% of Organic Waste")
                            .bold()
                        Text("Establish a composting system and target the diversion of 75% of organic waste from landfills.")
                        Button {
                            challenge4completed = true
                            challengesCompleted += 1
                        } label: {
                            Text("Done!")
                        }
                    }
                } else if tappedIndex == 4 {
                    VStack {
                        Text("Purchase 80% Recycled or Sustainable Products")
                            .bold()
                        Text("Quantify efforts to support environmentally friendly products by setting a goal to purchase 80% of goods made from recycled materials or produced sustainably.")
                        Button {
                            challenge5completed = true
                            challengesCompleted += 1
                        } label: {
                            Text("Done!")
                        }
                    }
                } else if tappedIndex == 5 {
                    VStack {
                        Text("Complete 10 Upcycling Projects Annually")
                            .bold()
                        Text("Set a numerical target for upcycling projects completed each year, focusing on creatively repurposing materials.")
                        Button {
                            challenge6completed = true
                            challengesCompleted += 1
                        } label: {
                            Text("Done!")
                        }
                    }
                } else if tappedIndex == 6 {
                    VStack {
                        Text("Reduce Water Usage by 20%")
                            .bold()
                        Text("Measure and reduce water consumption by 20%, using water-saving technologies and mindful usage.")
                        Button {
                            challenge7completed = true
                            challengesCompleted += 1
                        } label: {
                            Text("Done!")
                        }
                    }
                } else if tappedIndex == 7 {
                    VStack {
                        Text("Advocate to 100 Individuals Annually")
                        bold()
                        Text("Quantify the impact of educational advocacy by aiming to inform and influence 100 individuals each year about recycling and sustainable practices.")
                        Button {
                            challenge8completed = true
                            challengesCompleted += 1
                        } label: {
                            Text("Done!")
                        }
                    }
                } else if tappedIndex == 8 {
                    VStack {
                        Text("Cut Carbon Emissions by 15%")
                            .bold()
                        Text("Establish a numerical target to reduce personal carbon emissions by 15%, achieved through changes in transportation habits, energy use, and lifestyle choices.")
                        Button {
                            challenge9completed = true
                            challengesCompleted += 1
                        } label: {
                            Text("Done!")
                        }
                    }
                } else {
                    VStack {
                        Text("Please select one of the nine options given.")
                    }
                }
            }
            // Progress bar at the bottom
            ProgressView(value: progressValue)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
            
            // Display progress value
            Text("\(Int(progressValue * 100))%")
                .padding()
        }
        .padding()
    }
}

struct BingoView_Previews: PreviewProvider {
    static var previews: some View {
        BingoView()
    }
}
