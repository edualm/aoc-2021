//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public class Challenge: RunnableChallenge {
    
    typealias Point = (x: Int, y: Int)
    
    public let day: Int = 9
    
    let input: [[String]]
    
    public required init(input: [[String]]) {
        self.input = input
    }
    
    //  MARK: - Part 1
    
    private func adjacent(values: [[Int]], x: Int, y: Int) -> [Int] {
        var adj = [Int]()
        
        if x > 0 {
            adj.append(values[x - 1][y])
        }
        
        if y > 0 {
            adj.append(values[x][y - 1])
        }
        
        if x < (values.count - 1) {
            adj.append(values[x + 1][y])
        }
        
        if y < (values[x].count - 1) {
            adj.append(values[x][y + 1])
        }
        
        return adj
    }
    
    public func part1() -> String? {
        let values = input.map { $0.map { $0.map { $0 }.map(String.init).map { Int.init($0)! } } }.reduce([], +)
        
        var lowPoints = [Int]()
        
        for (x, xElement) in values.enumerated() {
            for (y, element) in xElement.enumerated() {
                var isLowPoint = true
                
                for adj in adjacent(values: values, x: x, y: y) {
                    if adj <= element {
                        isLowPoint = false
                    }
                }
                
                if isLowPoint {
                    lowPoints.append(element)
                }
            }
        }
        
        let sum = lowPoints.reduce(0, +) + lowPoints.count
        
        return "\(sum)"
    }
    
    //  MARK: - Part 2
    
    private var filledPoints = [Point]()
    
    private func adjacentPoints(values: [[Int]], x: Int, y: Int) -> [Point] {
        var adj = [Point]()
        
        if x > 0 {
            adj.append((x: x - 1, y: y))
        }
        
        if y > 0 {
            adj.append((x: x, y: y - 1))
        }
        
        if x < (values.count - 1) {
            adj.append((x: x + 1, y: y))
        }
        
        if y < (values[x].count - 1) {
            adj.append((x: x, y: y + 1))
        }
        
        return adj
    }
    
    private func part2Rec(values: [[Int]], currentPoint: Point) -> Int {
        let adjPoints = adjacentPoints(values: values, x: currentPoint.x, y: currentPoint.y)
        
        var sum = 0
        var pointsToCheck = [Point]()
        
        filledPoints.append(currentPoint)
        
        adjPoints.forEach { point in
            let value = values[point.x][point.y]
            
            guard value != 9 && !filledPoints.contains(where: { point.x == $0.x && point.y == $0.y }) else {
                return
            }
            
            sum += 1
            
            pointsToCheck.append(point)
            filledPoints.append(point)
        }
        
        return pointsToCheck.reduce(sum) { accum, point in
            return accum + part2Rec(values: values, currentPoint: point)
        }
    }

    public func part2() -> String? {
        filledPoints = []
        
        let values = input.map { $0.map { $0.map { $0 }.map(String.init).map { Int.init($0)! } } }.reduce([], +)
        
        var lowPoints = [(x: Int, y: Int)]()
        
        for (x, xElement) in values.enumerated() {
            for (y, element) in xElement.enumerated() {
                var isLowPoint = true
                
                for adj in adjacent(values: values, x: x, y: y) {
                    if adj <= element {
                        isLowPoint = false
                    }
                }
                
                if isLowPoint {
                    lowPoints.append((x: x, y: y))
                }
            }
        }
        
        let result = lowPoints
            .map { part2Rec(values: values, currentPoint: $0) + 1 }
            .sorted(by: >)
            .prefix(3)
            .reduce(1, *)
        
        return "\(result)"
    }
}
