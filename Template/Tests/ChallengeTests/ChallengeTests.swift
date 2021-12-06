//
//  ChallengeTests.swift
//  UtilitiesTests
//
//  Created by Eduardo Almeida on 30/11/2021.
//

import XCTest
import Utilities

@testable import Challenge

final class ChallengeTests: XCTestCase {
    
    func testPart1() throws {
        let testInput = try IOUtilities.readInput(fileName: "test.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part1(), nil)
    }
    
    func testPart2() throws {
        let testInput = try IOUtilities.readInput(fileName: "test.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part2(), nil)
    }
}
