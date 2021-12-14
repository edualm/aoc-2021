//
//  StringProtocol+Extensions.swift
//  Utilities
//
//  Created by Eduardo Almeida on 14/12/2021.
//

import Foundation

public extension StringProtocol {
    
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
