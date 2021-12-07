//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 7
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    private func calculate(valuesClosure: ((Int, [Int]) -> (Int))) -> String {
        let values = input.reduce([], +).compactMap(Int.init)
        
        let max = values.max()!
        
        var results = [Int]()
        
        for i in 0...max {
            results.append(valuesClosure(i, values))
        }
        
        return "\(results.min()!)"
    }
    
    public func part1() -> String? {
        calculate { i, values in
            var cost = 0
            
            values.forEach {
                cost += abs($0 - i)
            }
            
            return cost
        }
    }

    public func part2() -> String? {
        calculate { i, values in
            var cost = 0
            
            values.forEach {
                let steps = abs($0 - i)
                
                for i in 0..<steps {
                    cost += i + 1
                }
            }
            
            return cost
        }
    }
}
