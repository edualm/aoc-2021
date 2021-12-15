//
//  Array+Extensions.swift
//  Utilities
//
//  Created by Eduardo Almeida on 16/12/2021.
//

import Foundation

public extension Array where Element == [Int] {
    
    subscript(index: (y: Int, x: Int)) -> Int? {
        guard index.y < self.count else {
            return nil
        }
        
        let row = self[index.y]
        
        guard index.x < row.count else {
            return nil
        }
        
        return self[index.y][index.x]
    }
    
    subscript(coordinate: Coordinate) -> Int? {
        return self[(y: coordinate.y, x: coordinate.x)]
    }
}
