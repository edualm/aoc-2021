//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 17
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    func step(xVelocity: Int, yVelocity: Int, position: Coordinate) -> (Int, Int, Coordinate) {
        let newPosition = Coordinate(x: position.x + xVelocity, y: position.y + yVelocity)
        
        var newXVelocity = xVelocity
        
        if newXVelocity != 0 {
            newXVelocity -= 1
        }
        
        let newYVelocity = yVelocity - 1
        
        return (newXVelocity, newYVelocity, newPosition)
    }
    
    public func run() -> (String, String) {
        let values = input[0][0]
            .dropFirst(13)
            .components(separatedBy: ", ")
            .map {
                $0.suffix(from: $0.index($0.startIndex, offsetBy: 2)).split(separator: ".").map(String.init)
            }
        
        let area = (start: Coordinate(x: Int(values[0][0])!, y: Int(values[1][1])!),
                    end: Coordinate(x: Int(values[0][1])!, y: Int(values[1][0])!))
        
        var result = 0
        var count = 0
        
        for x in 0...1000 {
            for y in -1000...1000 {
                var xVelocity = x
                var yVelocity = y
                var crd = Coordinate(x: 0, y: 0)
                var highestY = 0
                
                while true {
                    let stepResult = step(xVelocity: xVelocity, yVelocity: yVelocity, position: crd)
                    
                    xVelocity = stepResult.0
                    yVelocity = stepResult.1
                    crd = stepResult.2
                    
                    if crd.y > highestY {
                        highestY = crd.y
                    }
                    
                    if crd.x > area.end.x || crd.y < area.end.y {
                        break
                    }
                    
                    if crd.x >= area.start.x && crd.x <= area.end.x && crd.y <= area.start.y && crd.y >= area.end.y {
                        if highestY > result {
                            result = highestY
                        }
                        
                        count += 1
                        
                        break
                    }
                }
            }
        }
        
        return ("\(result)", "\(count)")
    }
    
    public func part1() -> String? {
        run().0
    }

    public func part2() -> String? {
        run().1
    }
}
