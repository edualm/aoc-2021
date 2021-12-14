//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 14
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }

    public func solve(iterations: Int) -> String? {
        let flattened = input.reduce([], +)
        let polymerTemplate = flattened.first!
        
        let instructions = flattened.suffix(from: 1).reduce(into: [:] as [String: [String]]) { result, current in
            let split = current.components(separatedBy: " -> ")
            
            result[split.first!] = ["\(split.first!.first!)\(split.last!)", "\(split.last!)\(split.first!.last!)"]
        }
        
        var pairOccurrences = polymerTemplate.slidingWindow.reduce(into: [:] as [String: Int]) {
            if $0.keys.contains($1) {
                $0[$1]! += 1
            } else {
                $0[$1] = 1
            }
        }
        
        var characterOccurences = polymerTemplate.reduce(into: [:] as [Character: Int]) {
            if $0.keys.contains($1) {
                $0[$1]! += 1
            } else {
                $0[$1] = 1
            }
        }
        
        for _ in 0..<iterations {
            pairOccurrences = pairOccurrences.reduce(into: [:] as [String: Int]) { newPairOccurences, current in
                let (key, value) = current
                
                instructions[key]!.forEach {
                    if newPairOccurences.keys.contains($0) {
                        newPairOccurences[$0]! += value
                    } else {
                        newPairOccurences[$0] = value
                    }
                }
                
                let addedCharacter = instructions[key]![0][1]
                
                if characterOccurences.keys.contains(addedCharacter) {
                    characterOccurences[addedCharacter]! += value
                } else {
                    characterOccurences[addedCharacter] = value
                }
            }
        }
        
        let charactersByOccurences = characterOccurences.keys
            .map { ($0, characterOccurences[$0]!) }
            .sorted { $0.1 < $1.1 }
        
        return "\(charactersByOccurences.last!.1 - charactersByOccurences.first!.1)"
    }
    
    public func part1() -> String? {
        solve(iterations: 10)
    }
    
    public func part2() -> String? {
        solve(iterations: 40)
    }
}
