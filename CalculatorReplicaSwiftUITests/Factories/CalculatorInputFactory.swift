//
//  CalculatorInputFactory.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/25/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

struct CalculatorInputFactory {
    static func createStringIntegerNumber(with numberOfDigits: Int) -> String {
        return random(digits: numberOfDigits)
    }
    
    static func random(digits:Int) -> String {
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 1...9))"
        }
        return number
    }
}
