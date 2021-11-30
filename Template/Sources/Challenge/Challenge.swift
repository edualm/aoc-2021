//
//  Challenge.swift
//  Challenge
//
//  Created by Eduardo Almeida on 30/11/2021.
//

import Foundation
import Utilities

struct Challenge {
    
    let input: [[String]]
    
    func part1() {
        print("=== Part 1 ===\n")
        print("➜ Input: \(input)")
        print("➜ Number of lines: \(input.count)")
        print("➜ Input as flattened ints: \(input.reduce([], +).compactMap(Int.init))")
    }

    func part2() {
        print("=== Part 2 ===\n")
        print("➜ Input: \(input)")
        print("➜ Number of lines: \(input.count)")
        print("➜ Input as flattened ints: \(input.reduce([], +).compactMap(Int.init))")
    }
}
