//
//  Day_1.swift
//  Advent-of-Code-2015
//
//  Created by Daniel Paten on 28/3/2024.
//

import Foundation

struct Day_1 {
    static func p1(input: [String]) -> Int {
        let floorMap = input[0].map{String($0)}
        
        // get number of floors travelled up or down
        let up = floorMap.filter{$0 == "("}.count
        let down = floorMap.filter{$0 == ")"}.count
        
        // calculate resultant floor
        let floor = up - down
        return floor
    }
    
    static func p2(input: [String]) -> Int {
        let floorMap = input[0]
        
        // iterate over steps until basement is found
        var position = 0
        var floor = 0
        
        for i in floorMap {
            position += 1
            if i == "(" {
                floor += 1
            } else {
                floor -= 1
            }
            if floor == -1 { break }
        }
        
        return position
    }
}
