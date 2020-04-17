//
//  Double+Decimal.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/13/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

extension Double {
    func decimalCount() -> Int {
        guard self < Double(Int.max) else { return 0 }
        if self == Double(Int(self)) {
            return 0
        }

        let integerString = String(Int(self))
        let doubleString = String(Double(self))
        let decimalCount = doubleString.count - integerString.count - 1

        return decimalCount
    }
    
    var hasDecimals: Bool {
        return decimalCount() > 0
    }
}
