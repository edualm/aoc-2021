//
//  Challenge.swift
//  Challenge
//
//  Created by Eduardo Almeida on 30/11/2021.
//

import Foundation
import Utilities

struct Coordinate2D: Hashable {
    
    let x: Int
    let y: Int
}

struct VentLine: Hashable {
    
    let start: Coordinate2D
    let end: Coordinate2D
    
    init(_ coordinatesAsArray: [[String]]) {
        start = Coordinate2D(x: Int(coordinatesAsArray[0][0])!, y: Int(coordinatesAsArray[0][1])!)
        end = Coordinate2D(x: Int(coordinatesAsArray[1][0])!, y: Int(coordinatesAsArray[1][1])!)
    }
}

struct Challenge: RunnableChallenge {
    
    let day: Int = 5
    
    let input: [[String]]
    
    private func inputToValues() -> [VentLine] {
        return input
            .reduce([], +)
            .map { $0
                .components(separatedBy: " -> ")
                .map { $0
                    .split(separator: ",")
                    .map(String.init)
                }
            }
            .map(VentLine.init)
    }
    
    func part1() {
        let values = inputToValues()
        
        var map = [Coordinate2D: Int]()
        
        values.forEach { ventLine in
            if ventLine.start.x == ventLine.end.x {
                let startY = min(ventLine.start.y, ventLine.end.y)
                let endY = max(ventLine.start.y, ventLine.end.y)
                
                for y in startY...endY {
                    let crd = Coordinate2D(x: ventLine.start.x, y: y)
                    let initialValue = map[crd] ?? 0
                    
                    map[crd] = initialValue + 1
                }
            } else if ventLine.start.y == ventLine.end.y {
                let startX = min(ventLine.start.x, ventLine.end.x)
                let endX = max(ventLine.start.x, ventLine.end.x)
                
                for x in startX...endX {
                    let crd = Coordinate2D(x: x, y: ventLine.start.y)
                    let initialValue = map[Coordinate2D(x: x, y: ventLine.start.y)] ?? 0
                    
                    map[crd] = initialValue + 1
                }
            }
        }
        
        var result = 0
        
        map.values.forEach { value in
            if value >= 2 {
                result += 1
            }
        }
        
        print("Part 1 answer: \(result)")
    }

    func part2() {
        let values = inputToValues()
        
        var map = [Coordinate2D: Int]()
        
        values.forEach { ventLine in
            if ventLine.start.x == ventLine.end.x {
                let startY = min(ventLine.start.y, ventLine.end.y)
                let endY = max(ventLine.start.y, ventLine.end.y)
                
                for y in startY...endY {
                    let crd = Coordinate2D(x: ventLine.start.x, y: y)
                    let initialValue = map[crd] ?? 0
                    
                    map[crd] = initialValue + 1
                }
            } else if ventLine.start.y == ventLine.end.y {
                let startX = min(ventLine.start.x, ventLine.end.x)
                let endX = max(ventLine.start.x, ventLine.end.x)
                
                for x in startX...endX {
                    let crd = Coordinate2D(x: x, y: ventLine.start.y)
                    let initialValue = map[Coordinate2D(x: x, y: ventLine.start.y)] ?? 0
                    
                    map[crd] = initialValue + 1
                }
            } else if ventLine.end.x > ventLine.start.x {
                let startX = min(ventLine.start.x, ventLine.end.x)
                let endX = max(ventLine.start.x, ventLine.end.x)
                
                let startY = ventLine.start.y
                let endY = ventLine.end.y
                
                var delta = 0
                
                for x in startX...endX {
                    let crd = Coordinate2D(x: x, y: startY + delta)
                    let initialValue = map[crd] ?? 0
                    
                    map[crd] = initialValue + 1
                    
                    delta += startY < endY ? 1 : -1
                }
            } else {
                let startX = max(ventLine.start.x, ventLine.end.x)
                let endX = min(ventLine.start.x, ventLine.end.x)
                
                let startY = ventLine.start.y
                let endY = ventLine.end.y
                
                var delta = 0
                
                for x in stride(from: startX, through: endX, by: -1) {
                    let crd = Coordinate2D(x: x, y: startY + delta)
                    let initialValue = map[crd] ?? 0
                    
                    map[crd] = initialValue + 1
                    
                    delta += startY < endY ? 1 : -1
                }
            }
        }
        
        var result = 0
        
        map.values.forEach { value in
            if value >= 2 {
                result += 1
            }
        }
        
        print("Part 2 answer: \(result)")
    }
}
