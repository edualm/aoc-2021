//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public struct Challenge: RunnableChallenge {
    
    public struct Coordinate: Hashable {
        
        public let x: Int
        public let y: Int
    }
    
    public let day: Int = 11
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    private func increaseAllByOne(_ values: [[Int]]) -> [[Int]] {
        return values.map { $0.map { $0 + 1 } }
    }
    
    private func resetFlashedToZero(_ values: [[Int]]) -> [[Int]] {
        return values.map { $0.map {
            if $0 > 9 {
                return 0
            }
            
            return $0
        } }
    }
    
    private func increaseCoordinate(_ coordinate: Coordinate, values: inout [[Int]]) {
        if values[safe: coordinate.y]?[safe: coordinate.x] != nil {
            values[coordinate.y][coordinate.x] += 1
        }
    }
    
    private func flashStep(_ values: inout [[Int]], flashed: [Coordinate]) -> [Coordinate] {
        var flashed = flashed
        
        for y in 0..<values.count {
            for x in 0..<values.count {
                let element = values[y][x]
                
                if element > 9 && !flashed.contains(Coordinate(x: x, y: y)) {
                    flashed.append(Coordinate(x: x, y: y))
                    
                    for xValue in (x-1)...(x+1) {
                        for yValue in (y-1)...(y+1) {
                            increaseCoordinate(Coordinate(x: xValue, y: yValue), values: &values)
                        }
                    }
                }
            }
        }
        
        return flashed
    }
    
    public func part1() -> String? {
        var values = input
            .reduce([], +)
            .map { $0.map { Int(String($0))! } }
        
        var totalFlashed = 0
        
        for _ in 0..<100 {
            values = increaseAllByOne(values)
            
            var flashed = [Coordinate]()
            
            while true {
                let newFlashed = flashStep(&values, flashed: flashed)
                
                if flashed == newFlashed {
                    break
                }
                
                flashed = newFlashed
            }
            
            totalFlashed += flashed.count
            
            values = resetFlashedToZero(values)
        }
        
        return "\(totalFlashed)"
    }
    
    private func printBoard(_ values: [[Int]]) {
        for y in 0..<values.count {
            for x in 0..<values.count {
                print("\(values[y][x])", terminator: "")
            }
            
            print("")
        }
    }

    public func part2() -> String? {
        var values = input
            .reduce([], +)
            .map { $0.map { Int(String($0))! } }
        
        for x in 1..<Int.max {
            values = increaseAllByOne(values)
            
            var flashed = [Coordinate]()
            
            while true {
                let newFlashed = flashStep(&values, flashed: flashed)
                
                if flashed == newFlashed {
                    break
                }
                
                flashed = newFlashed
            }
            
            if flashed.count == 100 {
                return "\(x)"
            }
            
            values = resetFlashedToZero(values)
        }
        
        return nil
    }
}
