//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 10
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    let openingTokens = ["(", "[", "{", "<"]
    let closingTokens = [")", "]", "}", ">"]
    
    //  MARK: - Part 1
    
    private func openingToken(for token: String) -> String {
        return openingTokens[closingTokens.firstIndex(of: token)!]
    }
    
    private func part1Points(for token: String) -> Int {
        switch token {
        case ")": return 3
        case "]": return 57
        case "}": return 1197
        case ">": return 25137
        default: return 0
        }
    }
    
    public func part1() -> String? {
        let lines = input.reduce([], +).map { $0.map(String.init) }
        
        var firstIncorrectClosingCharacter = [String]()
        
        lines.forEach { line in
            var shouldBreak = false
            
            var openTokens = [String]()
            
            line.forEach { token in
                guard !shouldBreak else { return }
                
                if openingTokens.contains(token) {
                    openTokens.append(token)
                } else {
                    if openTokens.last! == openingToken(for: token) {
                        openTokens.removeLast()
                    } else {
                        firstIncorrectClosingCharacter.append(token)
                        shouldBreak = true
                    }
                }
            }
        }
        
        let totalPoints = firstIncorrectClosingCharacter.reduce(0) { accum, current in
            accum + part1Points(for: current)
        }
        
        return "\(totalPoints)"
    }
    
    //  MARK: - Part 2
    
    private func closingToken(for token: String) -> String {
        return closingTokens[openingTokens.firstIndex(of: token)!]
    }
    
    private func incompleteLines(_ lines: [[String]]) -> [[String]] {
        var ret = [[String]]()
        
        lines.forEach { line in
            var shouldBreak = false
            
            var openTokens = [String]()
            
            line.forEach { token in
                guard !shouldBreak else { return }
                
                if openingTokens.contains(token) {
                    openTokens.append(token)
                } else {
                    if openTokens.last! == openingToken(for: token) {
                        openTokens.removeLast()
                    } else {
                        shouldBreak = true
                    }
                }
            }
            
            if !shouldBreak {
                ret.append(line)
            }
        }
        
        return ret
    }
    
    private func part2Points(for token: String) -> Int {
        switch token {
        case ")": return 1
        case "]": return 2
        case "}": return 3
        case ">": return 4
        default: return 0
        }
    }
    
    public func part2() -> String? {
        let lines = input.reduce([], +).map { $0.map(String.init) }
        
        var lineScores = [Int]()
        
        incompleteLines(lines).forEach { line in
            var openTokens = [String]()
            
            line.forEach { token in
                if openingTokens.contains(token) {
                    openTokens.append(token)
                } else {
                    if openTokens.last! == openingToken(for: token) {
                        openTokens.removeLast()
                    }
                }
            }
            
            let lineScore = openTokens
                .reversed()
                .map(closingToken(for:))
                .reduce(0) { accum, current in
                    accum * 5 + part2Points(for: current)
                }
            
            lineScores.append(lineScore)
        }
        
        lineScores.sort()
        
        let pos = Int((Double(lineScores.count) / 2.0) - 0.5)
        
        return "\(lineScores[pos])"
    }
}
