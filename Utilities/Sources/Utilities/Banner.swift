//
//  Banner.swift
//  Utilities
//
//  Created by Eduardo Almeida on 02/12/2021.
//

import Foundation

enum Banner {
    
    static func with(day: Int) -> String {
        "🎅 🎄 🎁 Advent of Code 2021 - Day \(day >= 10 ? "\(day)" : "0\(day)") 🎅 🎄 🎁"
    }
}
