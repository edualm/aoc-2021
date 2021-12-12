//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public class Challenge: RunnableChallenge {
    
    typealias PathComponent = (from: String, to: String)
    
    public let day: Int = 12
    
    let input: [[String]]
    let values: [PathComponent]
    
    var result: [[PathComponent]]
    
    public required init(input: [[String]]) {
        self.input = input
        
        let values = input
            .reduce([], +)
            .map {
                $0.split(separator: "-").map(String.init)
            }
            .map {
                (from: $0.first!, to: $0.last!)
            }
        
        self.values = values + values.map(Challenge.reverseTuple(_:))
        self.result = []
    }
    
    private static func reverseTuple(_ tuple: (from: String, to: String)) -> (from: String, to: String) {
        (from: tuple.to, to: tuple.from)
    }
    
    private func calculatePaths(current: String, pathSoFar: [PathComponent], smallCavesVisited: [String]) {
        if let last = pathSoFar.last, last.to == "end" {
            result.append(pathSoFar)
            
            return
        }
        
        values
            .filter { $0.from == current && !smallCavesVisited.contains($0.from) }
            .forEach {
                let newSmallCavesVisited = smallCavesVisited + [current].filter { $0.lowercased() == $0 }
                
                calculatePaths(current: $0.to,
                               pathSoFar: pathSoFar + [$0],
                               smallCavesVisited: newSmallCavesVisited)
            }
    }
    
    public func part1() -> String? {
        calculatePaths(current: "start", pathSoFar: [], smallCavesVisited: [])
        
        return "\(result.count)"
    }
    
    private func smallCavesVisitedMoreThanOnce(_ smallCavesVisited: [String], next: String) -> Bool {
        let onlyLowercased = (smallCavesVisited + [next])
            .filter { $0.lowercased() == $0 }
        
        var found = false
        
        onlyLowercased.forEach { word in
            if found == true {
                return
            }
            
            found = onlyLowercased
                .filter { word == $0 }
                .count == 2
        }
        
        return found
    }
    
    private func calculatePaths2(current: String, pathSoFar: [PathComponent], smallCavesVisited: [String]) {
        if let last = pathSoFar.last, last.to == "end" {
            result.append(pathSoFar)
            
            return
        }
        
        values
            .filter {
                $0.from == current &&
                (!smallCavesVisited.contains($0.from) || !smallCavesVisitedMoreThanOnce(smallCavesVisited, next: $0.to)) &&
                (smallCavesVisited.count == 0 || $0.to != "start")
            }
            .forEach {
                let newSmallCavesVisited = smallCavesVisited + [current].filter { $0.lowercased() == $0 }
                
                calculatePaths2(current: $0.to,
                                pathSoFar: pathSoFar + [$0],
                                smallCavesVisited: newSmallCavesVisited)
            }
    }

    public func part2() -> String? {
        result = []
        
        calculatePaths2(current: "start", pathSoFar: [], smallCavesVisited: [])
        
        return "\(result.count)"
    }
}
