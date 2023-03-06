//
//  CalculatorInputFactory.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/25/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
@testable import Calculator

struct CalculatorInputFactory {
    
    // MARK: - Integer String Numbers
    
    static func createStringIntegerNumber(with numberOfDigitsRange: ClosedRange<Int>) -> String {
        let numberOfDigits = Int.random(in: numberOfDigitsRange)
        return random(digits: numberOfDigits)
    }
    
    static func createStringIntegerNumber(with numberOfDigits: Int) -> String {
        return random(digits: numberOfDigits)
    }
    
    // MARK: - Fractional String Numbers
    
    static func createFractionDigitNumber(with numberOfFractionDigits: Int) -> String {
        let numberIntegerDigits = Int.random(in: 1...9)
        let integerDigits = random(digits: numberIntegerDigits)
        let fractionDigits = random(digits: numberOfFractionDigits)
        return "\(integerDigits)\(CalculatorButtonRepresentable.decimal.rawValue)\(fractionDigits)"
    }
    
    // MARK: - Exponent String Numbers
    
    static func creatNumberWithExponent(with stringNumber: String, and exponentRange: ClosedRange<Int>) -> String {
        return addExponent(to: stringNumber, with: exponentRange)
    }
    
    // MARK: - Utils
    
    static func random(digits:Int) -> String {
        var number = String()
        for _ in 1...digits {
           number += "\(Int.random(in: 1...9))"
        }
        return number
    }
    
    static func addExponent(to stringNumber: String, with exponentRange: ClosedRange<Int>) -> String {
        let exponent = Int.random(in: exponentRange)
        let exponentString = "\(CalculatorButtonRepresentable.exponent.rawValue)\(exponent)"
        return stringNumber + exponentString
    }
}
