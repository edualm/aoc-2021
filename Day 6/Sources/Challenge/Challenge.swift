//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 6
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    func solve(days: Int) -> String? {
        let fishWithDays = input.reduce([], +).compactMap(Int.init)
        
        var population = Array(repeating: 0, count: 9)
        
        fishWithDays.forEach {
            population[$0] += 1
        }
        
        for _ in 0..<days {
            let willReproduce = population[0]
            
            population[0] = population[1]
            population[1] = population[2]
            population[2] = population[3]
            population[3] = population[4]
            population[4] = population[5]
            population[5] = population[6]
            population[6] = population[7] + willReproduce
            population[7] = population[8]
            population[8] = willReproduce
        }
        
        return "\(population.reduce(0, +))"
    }
    
    public func part1() -> String? {
        solve(days: 80)
    }

    public func part2() -> String? {
        solve(days: 256)
    }
}
