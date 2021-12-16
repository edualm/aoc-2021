//
//  ChallengeTests.swift
//  ChallengeTests
//

import XCTest
import Utilities

@testable import Challenge

final class ChallengeTests: XCTestCase {
    
    func testPart1_sample1() throws {
        let challenge = Challenge(input: [["D2FE28"]])
        
        XCTAssertEqual(challenge.part1(), "6")
    }
    
    func testPart1_sample2() throws {
        let challenge = Challenge(input: [["38006F45291200"]])
        
        XCTAssertEqual(challenge.part1(), "9")
    }
    
    func testPart1_sample3() throws {
        let challenge = Challenge(input: [["EE00D40C823060"]])
        
        XCTAssertEqual(challenge.part1(), "14")
    }
    
    func testPart1_example1() throws {
        let challenge = Challenge(input: [["8A004A801A8002F478"]])
        
        XCTAssertEqual(challenge.part1(), "16")
    }
    
    func testPart1_example2() throws {
        let challenge = Challenge(input: [["620080001611562C8802118E34"]])
        
        XCTAssertEqual(challenge.part1(), "12")
    }
    
    func testPart1_example3() throws {
        let challenge = Challenge(input: [["C0015000016115A2E0802F182340"]])
        
        XCTAssertEqual(challenge.part1(), "23")
    }
    
    func testPart1_example4() throws {
        let challenge = Challenge(input: [["A0016C880162017C3686B18A3D4780"]])
        
        XCTAssertEqual(challenge.part1(), "31")
    }
    
    func testPart1() throws {
        let testInput = try IOUtilities.readInput(fileName: "input.txt", isCommaSeparated: false)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part1(), "993")
    }
    
    func testPart2_example1() throws {
        let challenge = Challenge(input: [["C200B40A82"]])
        
        XCTAssertEqual(challenge.part2(), "3")
    }
    
    func testPart2_example2() throws {
        let challenge = Challenge(input: [["04005AC33890"]])
        
        XCTAssertEqual(challenge.part2(), "54")
    }
    
    func testPart2_example3() throws {
        let challenge = Challenge(input: [["880086C3E88112"]])
        
        XCTAssertEqual(challenge.part2(), "7")
    }
    
    func testPart2_example4() throws {
        let challenge = Challenge(input: [["CE00C43D881120"]])
        
        XCTAssertEqual(challenge.part2(), "9")
    }
    
    func testPart2_example5() throws {
        let challenge = Challenge(input: [["D8005AC2A8F0"]])
        
        XCTAssertEqual(challenge.part2(), "1")
    }
    
    func testPart2_example6() throws {
        let challenge = Challenge(input: [["F600BC2D8F"]])
        
        XCTAssertEqual(challenge.part2(), "0")
    }
    
    func testPart2_example7() throws {
        let challenge = Challenge(input: [["9C005AC2F8F0"]])
        
        XCTAssertEqual(challenge.part2(), "0")
    }
    
    func testPart2_example8() throws {
        let challenge = Challenge(input: [["9C0141080250320F1802104A08"]])
        
        XCTAssertEqual(challenge.part2(), "1")
    }
    
    func testPart2() throws {
        let testInput = try IOUtilities.readInput(fileName: "input.txt", isCommaSeparated: true)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part2(), "144595909277")
    }
}
