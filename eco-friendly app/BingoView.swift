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
                        Text("Emit at most 2,000 kilogrammes.")
                        Text(" ")
                    }
                } else if tappedIndex == 1 {
                    Text("")
                } else if tappedIndex == 2 {
                    Text("")
                } else if tappedIndex == 3 {
                    Text("")
                } else if tappedIndex == 4 {
                    Text("")
                } else if tappedIndex == 5 {
                    Text("")
                } else if tappedIndex == 6 {
                    Text("")
                } else if tappedIndex == 7 {
                    Text("")
                } else if tappedIndex == 8 {
                    Text("")
                } else {
                    VStack {
                        Text("Please select one of the nine options given.")
                        Text("If you're reading this you are a hacker 0_0")
                            .opacity(0)
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
