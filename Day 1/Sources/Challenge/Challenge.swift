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
        let inputs = input.reduce([], +).compactMap(Int.init)
        
        var previous = -1
        
        var sum = 0
        
        inputs.forEach {
            if $0 > previous && previous != -1 {
                sum += 1
            }
            
            previous = $0
        }
        
        print("Part 1 answer: \(sum)")
    }
    
    private func sumTuple(_ tuple: (Int, Int, Int)) -> Int {
        return tuple.0 + tuple.1 + tuple.2
    }

    func part2() {
        let inputs = input.reduce([], +).compactMap(Int.init)
        
        var previous = (-1, -1, -1)
        
        var sum = 0
        
        inputs.forEach {
            let curr = (previous.1, previous.2, $0)
            
            if previous.0 != -1 && sumTuple(curr) > sumTuple(previous) {
                sum += 1
            }
            
            previous = curr
        }
        
        print("Part 2 answer: \(sum)")
    }
}
