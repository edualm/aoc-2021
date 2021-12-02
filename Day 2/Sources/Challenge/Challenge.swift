//
//  Challenge.swift
//  Challenge
//
//  Created by Eduardo Almeida on 30/11/2021.
//

import Foundation
import Utilities

struct Challenge {
    
    enum Command {
        
        case forward(Int)
        case down(Int)
        case up(Int)
        
        init?(_ input: [String]) {
            guard input.count == 2 else { return nil }
            
            switch input[0] {
            case "forward":
                self = .forward(Int(input[1]) ?? 0)
                
            case "down":
                self = .down(Int(input[1]) ?? 0)
                
            case "up":
                self = .up(Int(input[1]) ?? 0)
                
            default:
                return nil
            }
        }
    }
    
    let input: [[String]]
    
    func part1() {
        let commands = input.reduce([], +)
            .map { $0.split(separator: " ").map(String.init) }
            .compactMap(Command.init)
        
        var verticalPosition = 0
        var horizontalPosition = 0
        
        commands.forEach {
            switch $0 {
            case .forward(let value):
                horizontalPosition += value
                
            case .down(let value):
                verticalPosition += value
                
            case .up(let value):
                verticalPosition -= value
            }
        }
        
        print("Part 1 answer: \(verticalPosition * horizontalPosition)")
    }

    func part2() {
        let commands = input.reduce([], +)
            .map { $0.split(separator: " ").map(String.init) }
            .compactMap(Command.init)
        
        var verticalPosition = 0
        var horizontalPosition = 0
        
        var aim = 0
        
        commands.forEach {
            switch $0 {
            case .forward(let value):
                horizontalPosition += value
                verticalPosition += aim * value
                
            case .down(let value):
                aim += value
                
            case .up(let value):
                aim -= value
            }
        }
        
        print("Part 2 answer: \(verticalPosition * horizontalPosition)")
    }
}
