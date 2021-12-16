//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    struct Packet {
        
        enum Contents {
            
            case immediate(Int)
            case `operator`([Packet])
        }
        
        let version: Int
        let typeID: Int
        
        let contents: Contents
        
        let length: Int
        
        init(input: String) {
            var consumedBits = 0
            
            version = Int(input.prefix(3), radix: 2)!
            typeID = Int(input.dropFirst(3).prefix(3), radix: 2)!
            
            consumedBits += 6
            
            let remaining = String(input.dropFirst(6))
            
            switch typeID {
            case 4:
                var binaryStr = ""
                
                for i in remaining.splitByLength(5) {
                    binaryStr += i.dropFirst()
                    
                    consumedBits += 5
                    
                    if i.first == "0" {
                        break
                    }
                }
                
                contents = .immediate(Int(binaryStr, radix: 2)!)
                
                length = consumedBits
                
            default:
                let lengthTypeID = remaining[0]
                
                consumedBits += 1
                
                switch lengthTypeID {
                case "0":
                    let lengthOfSubPackets = Int(input.dropFirst(7).prefix(15), radix: 2)!
                    let subPackets = String(input.dropFirst(22))
                    
                    consumedBits += 15
                    
                    var subPacketsRemaining = subPackets
                    
                    var lengthRemaining = lengthOfSubPackets
                    
                    var parsed = [Packet]()
                    
                    while lengthRemaining != 0 {
                        parsed.append(Packet(input: subPacketsRemaining))
                        
                        let parsedCharacters = parsed.last!.length
                        
                        subPacketsRemaining = String(subPacketsRemaining.dropFirst(parsedCharacters))
                        
                        lengthRemaining -= parsedCharacters
                    }
                    
                    contents = .operator(parsed)
                    
                    length = consumedBits + lengthOfSubPackets
                    
                case "1":
                    let numberOfSubPackets = Int(input.dropFirst(7).prefix(11), radix: 2)!
                    let subPackets = String(input.dropFirst(18))
                    
                    consumedBits += 11
                    
                    var subPacketsRemaining = subPackets
                    
                    var parsed = [Packet]()
                    
                    for _ in 0..<numberOfSubPackets {
                        parsed.append(Packet(input: subPacketsRemaining))
                        
                        subPacketsRemaining = String(subPacketsRemaining.dropFirst(parsed.last!.length))
                    }
                    
                    contents = .operator(parsed)
                    
                    length = consumedBits + (parsed.map { $0.length }.reduce(0, +))
                    
                default:
                    fatalError()
                }
            }
        }
    }
    
    public let day: Int = 16
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    private func getVersionNumberSum(packet: Packet) -> Int {
        var newValue = packet.version
        
        if case let .operator(packets) = packet.contents {
            for p in packets {
                newValue += getVersionNumberSum(packet: p)
            }
        }
        
        return newValue
    }
    
    private func calculate(packet: Packet) -> Int {
        switch packet.typeID {
        case 0:
            if case let .operator(packets) = packet.contents {
                return packets.map { calculate(packet: $0) }.reduce(0, +)
            } else {
                fatalError()
            }
            
        case 1:
            if case let .operator(packets) = packet.contents {
                return packets.map { calculate(packet: $0) }.reduce(1, *)
            } else {
                fatalError()
            }
            
        case 2:
            if case let .operator(packets) = packet.contents {
                return packets.map { calculate(packet: $0) }.sorted(by: <).first!
            } else {
                fatalError()
            }
            
        case 3:
            if case let .operator(packets) = packet.contents {
                return packets.map { calculate(packet: $0) }.sorted(by: >).first!
            } else {
                fatalError()
            }
            
        case 4:
            if case let .immediate(value) = packet.contents {
                return value
            } else {
                fatalError()
            }
            
        case 5:
            if case let .operator(packets) = packet.contents {
                return calculate(packet: packets[0]) > calculate(packet: packets[1]) ? 1 : 0
            } else {
                fatalError()
            }
            
        case 6:
            if case let .operator(packets) = packet.contents {
                return calculate(packet: packets[0]) < calculate(packet: packets[1]) ? 1 : 0
            } else {
                fatalError()
            }
            
        case 7:
            if case let .operator(packets) = packet.contents {
                return calculate(packet: packets[0]) == calculate(packet: packets[1]) ? 1 : 0
            } else {
                fatalError()
            }
            
        default:
            fatalError()
        }
    }
    
    public func part1() -> String? {
        let value = input.reduce([], +).first!.hexaToBinary
        
        let rootPacket = Packet(input: value)
        
        return "\(getVersionNumberSum(packet: rootPacket))"
    }

    public func part2() -> String? {
        let value = input.reduce([], +).first!.hexaToBinary
        
        let rootPacket = Packet(input: value)
        
        return "\(calculate(packet: rootPacket))"
    }
}
