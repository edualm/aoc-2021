//
//  Coordinate.swift
//  Utilities
//
//  Created by Eduardo Almeida on 16/12/2021.
//

import Foundation

public struct Coordinate: Hashable {
    
    public let x: Int
    public let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public var neighbors: Set<Coordinate> {
        [
            Coordinate(x: x - 1, y: y),
            Coordinate(x: x + 1, y: y),
            Coordinate(x: x, y: y - 1),
            Coordinate(x: x, y: y + 1)
        ]
    }
    
    public var neighborsWithDiagonals: Set<Coordinate> {
        [
            Coordinate(x: x - 1, y: y - 1),
            Coordinate(x: x, y: y - 1),
            Coordinate(x: x + 1, y: y - 1),
            
            Coordinate(x: x - 1, y: y),
            Coordinate(x: x, y: y),
            Coordinate(x: x + 1, y: y),
            
            Coordinate(x: x - 1, y: y + 1),
            Coordinate(x: x, y: y + 1),
            Coordinate(x: x + 1, y: y + 1)
        ]
    }
}
