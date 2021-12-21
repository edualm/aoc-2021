//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

protocol Dice {
    
    var rolls: Int { get }
    
    func roll() -> Int
}

class DeterministicDice: Dice {
    
    var sides: Int
    var rolls: Int = 0
    
    init(sides: Int = 100) {
        self.sides = sides
    }
    
    func roll() -> Int {
        let result = sides % 100 + 1
        
        sides += 1
        rolls += 1
        
        return result
    }
}

class GameState {
    
    class PlayerState {
        
        var position: Int
        var score: Int
        
        init(position: Int, score: Int = 0) {
            self.position = position
            self.score = score
        }
    }
    
    let boardSpaces: Int
    let playerStates: [PlayerState]
    var currentPlayer: Int
    let dice: Dice
    
    init(playerPositions: [Int], dice: Dice) {
        self.boardSpaces = 10
        self.playerStates = playerPositions.map { PlayerState(position: $0, score: 0) }
        self.currentPlayer = 0
        self.dice = dice
    }
    
    func play() {
        let player = playerStates[currentPlayer]
        
        var rollSum = [0, 0, 0].map { _ in dice.roll() }.reduce(0, +)
        
        rollSum += player.position
        
        while rollSum > 10 {
            rollSum -= 10
        }
        
        player.score += rollSum
        player.position = rollSum
        
        currentPlayer = (currentPlayer + 1) % playerStates.count
    }
    
    func checkIsFinished() -> Bool {
        for p in playerStates {
            if p.score >= 1000 {
                return true
            }
        }
        
        return false
    }
    
    func result() -> Int {
        return playerStates.sorted { p1, p2 in p1.score < p2.score }.first!.score * dice.rolls
    }
}

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 21
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    public func part1() -> String? {
        let positions = input
            .reduce([], +)
            .compactMap { $0.components(separatedBy: ":").last?.trimmingCharacters(in: .whitespaces) }
            .compactMap(Int.init)
        
        let gameState = GameState(playerPositions: positions, dice: DeterministicDice())
        
        while !gameState.checkIsFinished() {
            gameState.play()
        }
        
        return "\(gameState.result())"
    }

    public func part2() -> String? {
        return nil
    }
}
