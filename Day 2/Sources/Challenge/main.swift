//
//  main.swift
//  Challenge
//
//  Created by Eduardo Almeida on 30/11/2021.
//

import Foundation
import Utilities

enum Constants {
    
    static let year = 2021
    static let day = 2
    
    static var banner: String {
        "🎅 🎄 🎁 Advent of Code \(Constants.year) - Day \(Constants.day >= 10 ? "\(Constants.day)" : "0\(Constants.day)") 🎅 🎄 🎁"
    }
}

do {
    let arguments = ProcessInfo.processInfo.arguments
    let fileName = arguments.count >= 2 ? arguments[1] : "input.txt"
    
    print("\(Constants.banner)\n")
    
    let challenge = Challenge(input: try IOUtilities.readInput(fileName: fileName))
    
    challenge.part1()
    
    print("")
    
    challenge.part2()
} catch {
    print("❌ Execution Error: \(error)")
}
