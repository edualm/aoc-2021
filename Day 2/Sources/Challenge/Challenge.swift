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
            guard input.count == 2, let value = Int(input[1]) else { return nil }
            
            switch input[0] {
            case "forward":
                self = .forward(value)
                
            case "down":
                self = .down(value)
                
            case "up":
                self = .up(value)
                
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
        var depth = 0
        
        commands.forEach {
            switch $0 {
            case .forward(let value):
                depth += value
                
            case .down(let value):
                verticalPosition += value
                
            case .up(let value):
                verticalPosition -= value
            }
        }
        
        print("Part 1 answer: \(verticalPosition * depth)")
    }

    func part2() {
        let commands = input.reduce([], +)
            .map { $0.split(separator: " ").map(String.init) }
            .compactMap(Command.init)
        
        var verticalPosition = 0
        var depth = 0
        
        var aim = 0
        
        commands.forEach {
            switch $0 {
            case .forward(let value):
                depth += value
                verticalPosition += aim * value
                
            case .down(let value):
                aim += value
                
            case .up(let value):
                aim -= value
            }
        }
        
        print("Part 2 answer: \(verticalPosition * depth)")
    }
}
