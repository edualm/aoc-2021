//
//  BingoBoard.swift
//  Challenge
//
//  Created by Eduardo Almeida on 04/12/2021.
//

import Foundation

struct BingoBoard {
    
    struct Number {
        let number: Int
        let marked: Bool
        
        init(_ number: Int) {
            self.number = number
            self.marked = false
        }
        
        init(_ number: Int, marked: Bool) {
            self.number = number
            self.marked = marked
        }
        
        var markedCopy: Number {
            .init(number, marked: true)
        }
    }
    
    var board: [[Number]]
    
    var unmarkedNumberSum: Int {
        board
            .reduce([], +)
            .reduce(0) { sum, current in !current.marked ? sum + current.number : sum }
    }
    
    var isComplete: Bool {
        for x in 0..<5 {
            var hasUnmarked = false
            
            for y in 0..<5 {
                if !board[x][y].marked {
                    hasUnmarked = true
                }
            }
            
            if !hasUnmarked {
                return true
            }
        }
        
        for x in 0..<5 {
            var hasUnmarked = false
            
            for y in 0..<5 {
                if !board[y][x].marked {
                    hasUnmarked = true
                }
            }
            
            if !hasUnmarked {
                return true
            }
        }
        
        return false
    }
    
    mutating func mark(_ number: Int) {
        for x in 0..<5 {
            for y in 0..<5 {
                if board[x][y].number == number {
                    board[x][y] = board[x][y].markedCopy
                }
            }
        }
    }
}
