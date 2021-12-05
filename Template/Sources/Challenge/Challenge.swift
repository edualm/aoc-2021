//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

struct Challenge: RunnableChallenge {
    
    let day: Int = 0
    
    let input: [[String]]
    
    func part1() -> String? {
        print("➜ Input: \(input)")
        print("➜ Number of lines: \(input.count)")
        print("➜ Input as flattened ints: \(input.reduce([], +).compactMap(Int.init))")
        print("")
        
        return nil
    }

    func part2() -> String? {
        return nil
    }
}
