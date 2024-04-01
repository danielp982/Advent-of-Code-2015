//
//  Day_4.swift
//  Advent-of-Code-2015
//
//  Created by Daniel Paten on 31/3/2024.
//

import Foundation
import CryptoKit

struct Day_4 {
    static func p(input: [String], p1: Bool) -> Int {
        let secret = input[0]
        var num = 0
        var md5Readable: String
        let leading = p1 ? "00000" : "000000"
        
        repeat {
            // move onto the next number
            num += 1
            
            // loop through the numbers until you find the corresponding hash
            let input = secret + String(num)
            let md5 = Insecure.MD5.hash(data: input.data(using: .utf8)!)
            md5Readable = md5.map{String(format: "%02hhx", $0)}.joined()
            
        } while !md5Readable.starts(with: leading)
        
        return num
    }
}
