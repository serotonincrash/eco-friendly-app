//
//  CustomButtonStyle.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 22/11/23.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
