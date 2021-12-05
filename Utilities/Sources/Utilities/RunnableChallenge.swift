//
//  RunnableChallenge.swift
//  Utilities
//
//  Created by Eduardo Almeida on 02/12/2021.
//

import Foundation

public protocol RunnableChallenge {
    
    var day: Int { get }
    
    init(input: [[String]])
    
    func part1() -> String?
    func part2() -> String?
}
