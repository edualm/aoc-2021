//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 0
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    public func part1() -> String? {
        print("➜ Input: \(input)")
        print("➜ Number of lines: \(input.count)")
        print("➜ Input as flattened ints: \(input.reduce([], +).compactMap(Int.init))")
        print("")
        
        return nil
    }

    public func part2() -> String? {
        return nil
    }
}
