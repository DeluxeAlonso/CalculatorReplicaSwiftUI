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
        guard let decimal = Decimal(string: self) else { return 0 }
        return decimal.fractionalDigitsCount
    }
    
    func integerDigitsCount() -> Int {
        guard let decimal = Decimal(string: self) else { return 0 }
        return decimal.integerDigitsCount
    }
}
