//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 8
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    public func part1() -> String? {
        let parsed = input
            .reduce([], +)
            .map { $0.components(separatedBy: " | ") }
            .map { $0.map { $0.split(separator: " ").map(String.init) } }
        
        var count = 0
        
        parsed.forEach {
            $0[1].forEach {
                switch $0.count {
                case 2, 3, 4, 7:
                    count += 1
                default:
                    break
                }
            }
        }
        
        return "\(count)"
    }

    public func part2() -> String? {
        let parsed = input
            .reduce([], +)
            .map { $0.components(separatedBy: " | ") }
            .map { $0.map {
                    $0.split(separator: " ")
                        .map(String.init)
                        .map { $0.sorted() }
                }
            }
        
        var sum = 0
        
        parsed.forEach {
            var digits = [Int]()
            
            var charsToNumber = Array(repeating: [] as [Character], count: 10)
            
            charsToNumber[1] = $0[0].first(where: { $0.count == 2 })!
            charsToNumber[4] = $0[0].first(where: { $0.count == 4 })!
            charsToNumber[7] = $0[0].first(where: { $0.count == 3 })!
            charsToNumber[8] = $0[0].first(where: { $0.count == 7 })!
            
            charsToNumber[3] = $0[0].first(where: {
                $0.count == 5 &&
                $0.contains(charsToNumber[1][0]) &&
                $0.contains(charsToNumber[1][1])
            })!
            
            charsToNumber[5] = $0[0].first(where: {
                guard $0.count == 5 else { return false }
                
                var equalsCount = 0
                
                if $0.contains(charsToNumber[4][0]) {
                    equalsCount += 1
                }
                
                if $0.contains(charsToNumber[4][1]) {
                    equalsCount += 1
                }
                
                if $0.contains(charsToNumber[4][2]) {
                    equalsCount += 1
                }
                
                if $0.contains(charsToNumber[4][3]) {
                    equalsCount += 1
                }
                
                return equalsCount == 3 &&
                    $0 != charsToNumber[3]
            })!
            
            charsToNumber[2] = $0[0].first(where: {
                $0.count == 5 &&
                $0 != charsToNumber[3] &&
                $0 != charsToNumber[5]
            })!
            
            charsToNumber[6] = $0[0].first(where: {
                guard $0.count == 6 else { return false }
                
                var equalsCount = 0
                
                if $0.contains(charsToNumber[7][0]) {
                    equalsCount += 1
                }
                
                if $0.contains(charsToNumber[7][1]) {
                    equalsCount += 1
                }
                
                if $0.contains(charsToNumber[7][2]) {
                    equalsCount += 1
                }
                
                return equalsCount == 2
            })!
            
            charsToNumber[9] = $0[0].first(where: {
                guard $0.count == 6 else { return false }
                
                return $0.contains(charsToNumber[5][0]) &&
                    $0.contains(charsToNumber[5][1]) &&
                    $0.contains(charsToNumber[5][2]) &&
                    $0.contains(charsToNumber[5][3]) &&
                    $0.contains(charsToNumber[5][4]) &&
                    $0 != charsToNumber[6]
            })!
            
            charsToNumber[0] = $0[0].first(where: {
                $0.count == 6 &&
                $0 != charsToNumber[6] &&
                $0 != charsToNumber[9]
            })!
            
            $0[1].forEach {
                for (i, el) in charsToNumber.enumerated() {
                    if el == $0 {
                        digits.append(i)
                    }
                }
            }
            
            sum += Int(digits.reduce("") { accum, current in
                return accum + "\(current)"
            })!
        }
        
        return "\(sum)"
    }
}
