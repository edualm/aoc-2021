//
//  IOUtilitiesTests.swift
//  UtilitiesTests
//
//  Created by Eduardo Almeida on 30/11/2021.
//

import Utilities
import XCTest

final class IOUtilitiesTests: XCTestCase {
    
    func testParseInput() {
        let input = """
            1,2,3,x,foo
            bar,y,4,5,6
            """
        
        XCTAssertEqual(
            IOUtilities.parseInput(input),
            [
                ["1", "2", "3", "x", "foo"],
                ["bar", "y", "4", "5", "6"]
            ]
        )
    }
}
