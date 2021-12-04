//
//  Challenge.swift
//  Challenge
//
//  Created by Eduardo Almeida on 30/11/2021.
//

import Foundation
import Utilities

struct Challenge: RunnableChallenge {
    
    let day: Int = 4
    
    let input: [[String]]
    
    func parseBingoBoards() -> [BingoBoard] {
        var bingoBoards = [BingoBoard]()
        
        var currentBoard = [[BingoBoard.Number]]()
        
        for x in 1..<input.count {
            if currentBoard.count == 5 {
                bingoBoards.append(.init(board: currentBoard))
                currentBoard = []
            }
            
            let bingoNumbers = input[x][0]
                .split(separator: " ")
                .map(String.init)
                .compactMap(Int.init)
                .map(BingoBoard.Number.init)
            
            currentBoard.append(bingoNumbers)
        }
        
        bingoBoards.append(.init(board: currentBoard))
        
        return bingoBoards
    }
    
    func part1() {
        let numbers = input[0].compactMap(Int.init)
        
        var bingoBoards = parseBingoBoards()
        
        var complete = false
        
        numbers.forEach { number in
            if complete {
                return
            }
            
            for x in 0..<bingoBoards.count {
                bingoBoards[x].mark(number)
                
                if bingoBoards[x].isComplete {
                    complete = true
                    
                    print("Part 1 answer: \(bingoBoards[x].unmarkedNumberSum * number)")
                }
            }
        }
    }

    func part2() {
        let numbers = input[0].compactMap(Int.init)
        
        var bingoBoards = parseBingoBoards()
        
        var lastBingoBoard: BingoBoard?
        var lastBingoBoardNumber: Int?
        
        var wonIndexes = [Int]()
        
        numbers.forEach { number in
            for x in 0..<bingoBoards.count {
                bingoBoards[x].mark(number)
                
                if bingoBoards[x].isComplete && !wonIndexes.contains(x) {
                    lastBingoBoard = bingoBoards[x]
                    lastBingoBoardNumber = number
                    
                    wonIndexes.append(x)
                }
            }
        }
        
        print("Part 2 answer: \(lastBingoBoard!.unmarkedNumberSum * lastBingoBoardNumber!)")
    }
}
