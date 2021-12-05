//
//  IOUtilities.swift
//  Utilities
//
//  Created by Eduardo Almeida on 30/11/2021.
//

import Foundation

public enum IOUtilities {
    
    static public func parseInput(_ input: String, isCommaSeparated: Bool = true) -> [[String]] {
        let result = input
            .split(separator: "\n")
            .map(String.init)
        
        guard isCommaSeparated else { return [result] }
        
        return result.map { $0.split(separator: ",").map(String.init) }
    }
    
    static public func readInput(fileName: String = "input.txt", isCommaSeparated: Bool = true) throws -> [[String]] {
        let url = URL(fileURLWithPath: fileName)
        let contents = try String(contentsOf: url)
        
        return parseInput(contents, isCommaSeparated: isCommaSeparated)
    }
}
