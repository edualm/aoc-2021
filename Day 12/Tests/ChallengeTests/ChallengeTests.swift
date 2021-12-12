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
        
        XCTAssertEqual(challenge.part1(), "10")
    }
    
    func testPart1_input2() throws {
        let testInput = try IOUtilities.readInput(fileName: "test-2.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part1(), "19")
    }
    
    func testPart1_input3() throws {
        let testInput = try IOUtilities.readInput(fileName: "test-3.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part1(), "226")
    }
    
    func testPart2() throws {
        let testInput = try IOUtilities.readInput(fileName: "test.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part2(), "36")
    }
    
    func testPart2_input2() throws {
        let testInput = try IOUtilities.readInput(fileName: "test-2.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part2(), "103")
    }
    
    func testPart2_input3() throws {
        let testInput = try IOUtilities.readInput(fileName: "test-3.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part2(), "3509")
    }
}
