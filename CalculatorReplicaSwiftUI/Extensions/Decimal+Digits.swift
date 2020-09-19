//
//  Decimal+Digits.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/18/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

extension Decimal {
    var fractionalDigitsCount: Int {
        return max(-exponent, 0)
    }
    
    var integerDigitsCount: Int {
        let decimalSignificand = NSDecimalNumber(decimal: significand)
        let decimalSignificandCount = String(decimalSignificand.intValue).count
        return max(decimalSignificandCount + exponent, 1)
    }
}
