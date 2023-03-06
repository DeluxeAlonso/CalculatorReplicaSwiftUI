//
//  DecimalFormatter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/20/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class DecimalFormatter: NumberFormatter {
    override init() {
        super.init()
        numberStyle = .decimal
        maximumFractionDigits = Constants.decimalMaximumFractionDigits
        decimalSeparator = CalculatorButtonRepresentable.decimal.rawValue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DecimalFormatter {
    struct Constants {
        static let decimalMaximumFractionDigits = 8
    }
}
