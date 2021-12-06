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
    
    public func challengeInput(inputIsCommaSeparated: Bool = true, overrideFileName: String? = nil) throws -> [[String]] {
        let arguments = ProcessInfo.processInfo.arguments
        
        let fileName: String
        
        if let overrideFileName = overrideFileName {
            fileName = overrideFileName
        } else {
            fileName = arguments.count >= 2 ? arguments[1] : "input.txt"
        }
        
        return try IOUtilities.readInput(fileName: fileName, isCommaSeparated: inputIsCommaSeparated)
    }
    
    public func run(inputIsCommaSeparated: Bool = true) {
        do {
            let challenge = challengeType.init(input: try challengeInput(inputIsCommaSeparated: inputIsCommaSeparated))
            
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
