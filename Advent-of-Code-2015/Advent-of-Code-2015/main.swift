//
//  main.swift
//  Advent-of-Code-2015
//
//  Created by Daniel Paten on 28/3/2024.
//

import Foundation

// custom error handling
enum AoC_Error: Error {
    case invalid_day(day: Int)
}

// TO UPDATE PER RUN
let day = 4
let p1 = true

do {
    let input = try InputReader.readFile(day: day)
    
    // start the timer
    let startTime = DispatchTime.now()
    var result: Int
    
    // execute the current day/part
    switch day {
    case 1:
        result = p1 ? Day_1.p1(input: input) : Day_1.p2(input: input)
    case 2:
        result = Day_2.p(input: input, p1: p1)
    case 3:
        result = p1 ? try Day_3.p1(input: input) : try Day_3.p2(input: input)
    case 4:
        result = Day_4.p(input: input, p1: p1)
    default:
        throw AoC_Error.invalid_day(day: day)
    }
    
    // stop the timer
    let endTime = DispatchTime.now()
    
    // print result
    print(result)
    
    // calculate execution time
    let elapsedTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    let elapsedTimeMilliseconds = Double(elapsedTime) / 1_000_000
    let elapsedTimeSeconds = Double(elapsedTime) / 1_000_000_000
    
    // print execution time
    print("Execution time: \(elapsedTimeMilliseconds) ms (\(elapsedTimeSeconds) s)")
} catch {
    print(error)
}
