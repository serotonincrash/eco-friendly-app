//
//  CountdownTimerView.swift
//  eco-friendly app
//
//  Copied from the Internet.
//

import SwiftUI

struct CountdownTimerView: View {

    @Binding var day: Int
    @Binding var hour: Int
    @Binding var minute: Int
    @Binding var second: Int

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(spacing: 8) {
                    Text(String(format: "%02d", day))
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(day == 0 ? .red : .green)
                    Text("day")
                        .textCase(.uppercase)
                        .font(.system(size: 11))
                }
                VStack(spacing: 8) {
                    colon
                    Spacer()
                        .frame(height: 15)
                }
                VStack(spacing: 8) {
                    Text(String(format: "%02d", hour))
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(day == 0 ? .red : .green)
                    Text("hour")
                        .textCase(.uppercase)
                        .font(.system(size: 11))
                }
                VStack(spacing: 8) {
                    colon
                    Spacer()
                        .frame(height: 15)
                }
                VStack(spacing: 8) {
                    Text(String(format: "%02d", minute))
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(day == 0 ? .red : .green)
                    Text("min")
                        .textCase(.uppercase)
                        .font(.system(size: 11))
                }
                VStack(spacing: 8) {
                    colon
                    Spacer()
                        .frame(height: 15)
                }
                VStack(spacing: 8) {
                    Text(String(format: "%02d", second))
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(day == 0 ? .red : .green)
                    Text("sec")
                        .textCase(.uppercase)
                        .font(.system(size: 11))
                }
            }
        }
    }
}

extension CountdownTimerView {
    private var colon: some View {
        Text(":")
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(day == 0 ? .red : .green)
    }
}
