//
//  InputReader.swift
//  Advent-of-Code-2015
//
//  Created by Daniel Paten on 28/3/2024.
//

import Foundation

class InputReader {
    static func readFile(day: Int) throws -> [String] {
        do {
            let path = Bundle.main.path(forResource: "/Inputs/Day_\(day)_Input", ofType: "txt")!
            let data = try String(contentsOfFile: path, encoding: .utf8)
            return data.components(separatedBy: .newlines).dropLast()
        } catch {
            throw InputReader_Error.input_not_found
        }
    }
    
    // custom error handling
    enum InputReader_Error: Error {
        case input_not_found
    }
}
