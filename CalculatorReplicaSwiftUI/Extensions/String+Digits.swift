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
        return decimal.fractionalDigitsCount
    }
    
    func integerDigitsCount() -> Int {
        guard let decimal = Decimal(string: self) else { return 1 }
        return decimal.integerDigitsCount
    }
    
    func hasExponent() -> Bool {
        return self.lowercased().contains("e")
        //guard let decimal = Decimal(string: self) else { return true }
        //return decimal.exponent != 0
    }
}
