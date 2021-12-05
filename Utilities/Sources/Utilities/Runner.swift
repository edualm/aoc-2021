//
//  Runner.swift
//  Utilities
//
//  Created by Eduardo Almeida on 02/12/2021.
//

import Foundation

public struct Runner {
    
    let challengeType: RunnableChallenge.Type
    
    public init(challengeType: RunnableChallenge.Type) {
        self.challengeType = challengeType
    }
    
    public func run(inputIsCommaSeparated: Bool = true) {
        do {
            let arguments = ProcessInfo.processInfo.arguments
            let fileName = arguments.count >= 2 ? arguments[1] : "input.txt"
            
            let challenge = challengeType.init(input: try IOUtilities.readInput(fileName: fileName, isCommaSeparated: inputIsCommaSeparated))
            
            print("\(Banner.with(day: challenge.day))\n")
            
            if let answer = challenge.part1() {
                print("Part 1 answer: \(answer)")
            }
            
            if let answer = challenge.part2() {
                print("Part 2 answer: \(answer)")
            }
        } catch {
            print("❌ Execution Error: \(error)")
        }
    }
}
