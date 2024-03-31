//
//  Day_3.swift
//  Advent-of-Code-2015
//
//  Created by Daniel Paten on 31/3/2024.
//

import Foundation

struct Day_3 {
    static func p1(input: [String]) throws -> Int {
        // variables for the coords and counts
        var coords = Set<String>()
        var currentX = 0
        var currentY = 0
        coords.insert("0,0") // always count the first house
        
        let directions = input[0].map{String($0)}
        
        for direction in directions {
            // determine the new coords
            switch direction {
            case "^":
                currentY += 1
            case "v":
                currentY -= 1
            case "<":
                currentX -= 1
            case ">":
                currentX += 1
            default:
                throw Day_3_Error.invalid_direction
            }
            
            // add to the count of houses
            let newKey = "\(currentX),\(currentY)"
            coords.insert(newKey)
        }
        
        // determine number of houses with a delivery
        return coords.count
    }
    
    static func p2(input: [String]) throws -> Int {
        // variables for the coords and counts
        var coords = [true : Set<String>(), false: Set<String>()]
        var currentX = [true : 0, false: 0]
        var currentY = [true : 0, false: 0]
        
        // always count the first house for both
        coords[true]?.insert("0,0")
        coords[false]?.insert("0,0")
        
        let directions = input[0].map{String($0)}
        var robo = false
        
        for direction in directions {
            // determine which one we are updating
            
            // determine the new coords
            switch direction {
            case "^":
                currentY[robo]! += 1
            case "v":
                currentY[robo]! -= 1
            case "<":
                currentX[robo]! -= 1
            case ">":
                currentX[robo]! += 1
            default:
                throw Day_3_Error.invalid_direction
            }
            
            // add to the count of houses
            let newKey = "\(currentX[robo]!),\(currentY[robo]!)"
            coords[robo]?.insert(newKey)
            
            // switch to the next Santa
            robo = !robo
        }
        
        // determine number of houses with a delivery
        return coords[true]!.union(coords[false]!).count
    }
    
    // custom error handling
    enum Day_3_Error: Error {
        case invalid_direction
    }
}
