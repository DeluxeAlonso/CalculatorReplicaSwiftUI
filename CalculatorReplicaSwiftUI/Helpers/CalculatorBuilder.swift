//
//  CalculatorBuilder.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorBuilder {
    static func buildCalculatorOptions() -> [[CalculatorOptionProtocol]] {
        let firstRowOptions = [
            CalculatorOption(representable: .clear,
                             backgroundColor: Color(.lightGray),
                             operation: .clear),
            CalculatorOption(representable: .negative,
                             backgroundColor: Color(.lightGray),
                             operation: .unaryOperation({ -$0 })),
            CalculatorOption(representable: .percent,
                             backgroundColor: Color(.lightGray),
                             operation: .unaryOperation({ $0 / 100.0 })),
            CalculatorOption(representable: .division,
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 / $1 }))
        ]
        
        let secondRowOptions = [
            CalculatorOption(representable: .seven),
            CalculatorOption(representable: .eight),
            CalculatorOption(representable: .nine),
            CalculatorOption(representable: .multiplication,
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 * $1 }))
        ]
        
        let thirdRowOptions = [
            CalculatorOption(representable: .four),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .six),
            CalculatorOption(representable: .subtraction,
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 - $1 }))
        ]
        
        let fourthRowOptions = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .two),
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .sum,
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 + $1 }))
        ]
        
        let fifthRowOptions = [
            CalculatorOption(representable: .zero, gridSpace: 2),
            CalculatorOption(representable: .decimal, operation: .decimal),
            CalculatorOption(representable: .equal,
                             backgroundColor: Color(.orange),
                             operation: .equals)
        ]
        
        return [
            firstRowOptions,
            secondRowOptions,
            thirdRowOptions,
            fourthRowOptions,
            fifthRowOptions
        ]
    }
}
