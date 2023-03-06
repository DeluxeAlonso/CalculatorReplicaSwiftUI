//
//  ScientificFormatter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/20/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class ScientificFormatter: NumberFormatter {
    override init() {
        super.init()
        numberStyle = .scientific
        maximumIntegerDigits = 1
        maximumFractionDigits = Constants.scientificMaximumFractionDigits
        decimalSeparator = CalculatorButtonRepresentable.decimal.rawValue
        exponentSymbol = CalculatorButtonRepresentable.exponent.rawValue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScientificFormatter {
    struct Constants {
        static let scientificMaximumFractionDigits = 5
    }
}
