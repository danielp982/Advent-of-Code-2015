//
//  Day_2.swift
//  Advent-of-Code-2015
//
//  Created by Daniel Paten on 28/3/2024.
//

import Foundation

struct Day_2 {
    static func p(input: [String], p1: Bool) -> Int {
        
        var sum = 0
        
        for dim in input {
            // extract measurements
            let mments = dim.components(separatedBy: "x")
            let l = Int(mments[0])!
            let w = Int(mments[1])!
            let h = Int(mments[2])!
            
            // calculation based on part
            if p1 {
                sum += getAreaPaper(l: l, w: w, h: h)
            } else {
                sum += getAreaRibbon(l: l, w: w, h: h)
            }
        }
        return sum
    }
    
    // summing function for Part 1
    private static func getAreaPaper(l: Int, w: Int, h: Int) -> Int {
        let a1 = l*w
        let a2 = w*h
        let a3 = l*h
        
        return 2*a1 + 2*a2 + 2*a3 + min(a1, a2, a3)
    }
    
    // summing function for Part 2
    private static func getAreaRibbon(l: Int, w: Int, h: Int) -> Int {
        let sizesSorted = [w, l, h].sorted()
        
        return 2*sizesSorted[0] + 2*sizesSorted[1] + (w * l * h)
    }
}
