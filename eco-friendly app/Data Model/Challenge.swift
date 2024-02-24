//
//  StructFile.swift
//  eco-friendly app
//
//  Created by Yew Rei An on 24/11/23.
//

import Foundation

struct Challenge: Codable {
    var challengeIndex: Int
    var challengeTitle: String
    var challengeDescription: String
    var progress: Float
    var completed: Bool
    var buttonClicked: Bool
}
