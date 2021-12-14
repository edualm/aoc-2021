//
//  String+Extensions.swift
//  Utilities
//
//  Created by Eduardo Almeida on 14/12/2021.
//

import Foundation

public extension String {
    
    var slidingWindow: [String] {
        var elements = [String]()
        
        for i in 0..<(count - 1) {
            let j = i + 1
            
            elements.append("\(self[i])\(self[j])")
        }
        
        return elements
    }
}
