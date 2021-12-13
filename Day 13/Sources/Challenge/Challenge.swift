//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    enum Fold {
        
        case x(Int)
        case y(Int)
    }
    
    struct Coordinate: Hashable {
        
        let x: Int
        let y: Int
        
        init(_ array: [Int]) {
            guard array.count == 2 else { fatalError() }
            
            x = array[0]
            y = array[1]
        }
        
        init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
    }
    
    public let day: Int = 13
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    private func fold(initial: [Coordinate], at: Fold) -> [Coordinate] {
        var grid = [Coordinate]()
        
        switch at {
        case .x(let pos):
            initial.forEach {
                if $0.x < pos {
                    grid.append($0)
                } else {
                    grid.append(Coordinate(x: pos - ($0.x - pos), y: $0.y))
                }
            }
        case .y(let pos):
            initial.forEach {
                if $0.y < pos {
                    grid.append($0)
                } else {
                    grid.append(Coordinate(x: $0.x, y: pos - ($0.y - pos)))
                }
            }
        }
        
        return Array(Set(grid))
    }
    
    private func boardRepresentation(_ board: [Coordinate]) -> String {
        var representation = ""
        
        var biggestX = 0
        var biggestY = 0
        
        board.forEach {
            if $0.x > biggestX {
                biggestX = $0.x
            }
            
            if $0.y > biggestY {
                biggestY = $0.y
            }
        }
        
        for y in 0...biggestY {
            for x in 0...biggestX {
                if board.contains(Coordinate(x: x, y: y)) {
                    representation += "#"
                } else {
                    representation += "."
                }
            }
            
            representation += "\n"
        }
        
        return representation
    }
    
    private func common() -> (dotCoordinates: [Coordinate], foldInstructions: [Fold]) {
        let dotCoordinates = input
            .filter { $0.count == 2 }
            .map { $0.map { Int($0)! } }
            .map(Coordinate.init)
        
        let foldInstructions = input
            .filter { $0.count == 1 }
            .reduce([], +)
            .compactMap { instruction -> Fold? in
                if instruction.contains("x") {
                    return Fold.x(Int(instruction.replacingOccurrences(of: "fold along x=", with: ""))!)
                }
                
                if instruction.contains("y") {
                    return Fold.y(Int(instruction.replacingOccurrences(of: "fold along y=", with: ""))!)
                }
                
                return nil
            }
        
        return (dotCoordinates, foldInstructions)
    }
    
    public func part1() -> String? {
        let (dotCoordinates, foldInstructions) = common()
        
        let result = fold(initial: dotCoordinates, at: foldInstructions.first!)
        
        return "\(result.count)"
    }

    public func part2() -> String? {
        let (dotCoordinates, foldInstructions) = common()
        
        var folded = dotCoordinates
        
        foldInstructions.forEach {
            folded = fold(initial: folded, at: $0)
        }
        
        return "\n" + boardRepresentation(folded)
    }
}
