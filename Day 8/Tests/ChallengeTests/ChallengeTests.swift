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
        let testInput = try IOUtilities.readInput(fileName: "test-2.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part1(), "26")
    }
    
    func testPart2_input1() throws {
        let testInput = try IOUtilities.readInput(fileName: "test-1.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part2(), "5353")
    }
    
    func testPart2_input2() throws {
        let testInput = try IOUtilities.readInput(fileName: "test-2.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part2(), "61229")
    }
}
