//
//  String+Digits.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/17/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

extension String {
    func fractionDigitsCount() -> Int {
        guard let decimal = Decimal(string: self) else { return CalculatorConstants.calculatorDisplayMaxLimit }
        guard !decimal.isZero else { return 0 }
        return decimal.fractionalDigitsCount
    }
    
    func integerDigitsCount() -> Int {
        guard let decimal = Decimal(string: self) else { return 1 }
        return decimal.integerDigitsCount
    }
    
    func hasExponent() -> Bool {
        return self.lowercased().contains(CalculatorOptionRepresentable.exponent.rawValue)
    }
    
    func hasDecimal(checkForDecimalCharacter: Bool = false) -> Bool {
        if checkForDecimalCharacter {
            return fractionDigitsCount() > 0 || contains(CalculatorOptionRepresentable.decimal.rawValue)
        } else {
            return fractionDigitsCount() > 0
        }
    }
    
    func extractLastCharactersOf(_ character: Character) -> Self {
        var array: [String] = []
        var mutableString = self
        while let lastCharacter = mutableString.popLast(), lastCharacter == character {
            array.insert(String(lastCharacter), at: 0)
        }
        return array.joined()
    }
    
    func extractLastCharactersOf(_ characters: [Character]) -> Self {
        var array: [String] = []
        var mutableString = self
        while let lastCharacter = mutableString.popLast(), characters.contains(lastCharacter) {
            guard !mutableString.isEmpty else { continue }
            array.insert(String(lastCharacter), at: 0)
        }
        return array.joined()
    }
    
    func trimLeadingOcurrencesOf(_ character: Character) -> Self {
        return String(drop { $0 == character })
    }
}
