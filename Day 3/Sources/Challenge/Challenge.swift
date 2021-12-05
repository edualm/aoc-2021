//
//  Challenge.swift
//  Challenge
//
//  Created by Eduardo Almeida on 30/11/2021.
//

import Foundation
import Utilities

struct Challenge: RunnableChallenge {
    
    let day: Int = 0
    
    let input: [[String]]
    
    func part1() -> String? {
        let inputs = input.reduce([], +)
        
        var gammaRateNumbers = [String]()
        var epsilonRateNumbers = [String]()
        
        for x in 0..<inputs.first!.count {
            var zeros = 0
            var ones = 0
            
            inputs.forEach { number in
                if number[number.index(number.startIndex, offsetBy: x)] == "0" {
                    zeros += 1
                } else {
                    ones += 1
                }
            }
            
            gammaRateNumbers.append(zeros > ones ? "0" : "1")
            epsilonRateNumbers.append(zeros > ones ? "1" : "0")
        }
        
        let gammaRateAsBinaryStr = gammaRateNumbers.reduce("", +)
        let epsilonRateAsBinaryStr = epsilonRateNumbers.reduce("", +)
        
        let gammaRate = Int(gammaRateAsBinaryStr, radix: 2)!
        let epsilonRate = Int(epsilonRateAsBinaryStr, radix: 2)!
        
        return "\(gammaRate * epsilonRate)"
    }

    func part2() -> String? {
        let inputs = input.reduce([], +)
        
        var gammaRateNumbers = inputs
        var epsilonRateNumbers = inputs
        
        for x in 0..<gammaRateNumbers.first!.count {
            if gammaRateNumbers.count == 1 {
                break
            }
            
            var zeros = [String]()
            var ones = [String]()
            
            gammaRateNumbers.forEach { number in
                if number[number.index(number.startIndex, offsetBy: x)] == "0" {
                    zeros.append(number)
                } else {
                    ones.append(number)
                }
            }
            
            if zeros.count > ones.count {
                gammaRateNumbers = zeros
            } else {
                gammaRateNumbers = ones
            }
        }
        
        for x in 0..<epsilonRateNumbers.first!.count {
            if epsilonRateNumbers.count == 1 {
                break
            }
            
            var zeros = [String]()
            var ones = [String]()
            
            epsilonRateNumbers.forEach { number in
                if number[number.index(number.startIndex, offsetBy: x)] == "0" {
                    zeros.append(number)
                } else {
                    ones.append(number)
                }
            }
            
            if zeros.count > ones.count {
                epsilonRateNumbers = ones
            } else {
                epsilonRateNumbers = zeros
            }
        }
        
        let gammaRate = Int(gammaRateNumbers.first!, radix: 2)!
        let epsilonRate = Int(epsilonRateNumbers.first!, radix: 2)!
        
        return "\(gammaRate * epsilonRate)"
    }
}
