//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public class Challenge: RunnableChallenge {
    
    private struct HistoryEntry: Comparable {
        
        let totalCost: Int
        let lastEntry: Coordinate
        
        static func <(lhs: Challenge.HistoryEntry, rhs: Challenge.HistoryEntry) -> Bool {
            lhs.totalCost < rhs.totalCost
        }
    }
    
    public let day: Int = 15
    
    var values: [[Int]]
    var visited: Set<Coordinate> = []
    
    public required init(input: [[String]]) {
        values = input
            .reduce([], +)
            .map {
                $0.map(String.init).map { Int($0)! }
            }
    }
    
    private func coordinateIsValid(_ crd: Coordinate) -> Bool {
        crd.y >= 0 &&
        crd.x >= 0 &&
        crd.y < values.count &&
        crd.x < values[0].count
    }
    
    private func dijkstraIteration(currentNode: Coordinate, currentCost: Int) -> [HistoryEntry] {
        return currentNode.neighbors
            .filter(coordinateIsValid)
            .filter {
                !visited.contains($0)
            }.map {
                visited.insert($0)
                
                return HistoryEntry(totalCost: currentCost + values[$0]!,
                                    lastEntry: $0)
            }
    }
    
    public func run() -> String? {
        visited = []
        
        let destination = Coordinate(x: values[0].count - 1, y: values.count - 1)
        
        var heap = Heap(array: [
            HistoryEntry(totalCost: 0, lastEntry: Coordinate(x: 0, y: 0))
        ], sort: <)
        
        var result: String?
        
        while result == nil {
            let element = heap.remove()!
            
            heap.insert(dijkstraIteration(currentNode: element.lastEntry,
                                          currentCost: element.totalCost))
            
            if heap.peek()?.lastEntry == destination {
                result = "\(heap.peek()!.totalCost)"
            }
        }
        
        return result
    }
    
    public func part1() -> String? {
        run()
    }
    
    public func part2() -> String? {
        var newLines = [[Int]]()
        
        for line in values {
            var newLine = [Int]()
            
            for x in 0...4 {
                newLine.append(contentsOf: line.map {
                    var res = $0 + x
                    
                    if res > 9 {
                        res -= 9
                    }
                    
                    return res
                })
            }
            
            newLines.append(newLine)
        }
        
        values = newLines
        
        for i in 1...4 {
            newLines.forEach {
                values.append($0.map {
                    var res = $0 + i
                    
                    if res > 9 {
                        res -= 9
                    }
                    
                    return res
                })
            }
        }
        
        return run()
    }
}
