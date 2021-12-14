//
//  ChallengeTests.swift
//  ChallengeTests
//

import XCTest
import Utilities

@testable import Challenge

final class ChallengeTests: XCTestCase {
    
    func testPart1() throws {
        let testInput = try IOUtilities.readInput(fileName: "test.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part1(), "1588")
    }
    
    func testPart2() throws {
        let testInput = try IOUtilities.readInput(fileName: "test.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part2(), "2188189693529")
    }
}
