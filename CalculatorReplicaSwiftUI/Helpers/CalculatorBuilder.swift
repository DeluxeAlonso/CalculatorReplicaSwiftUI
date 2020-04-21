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
            CalculatorOption(title: "AC",
                             backgroundColor: Color(.lightGray),
                             operation: .clear),
            CalculatorOption(title: "+-",
                             backgroundColor: Color(.lightGray),
                             operation: .unaryOperation({ -$0 })),
            CalculatorOption(title: "%",
                             backgroundColor: Color(.lightGray),
                             operation: .unaryOperation({ $0 / 100.0 })),
            CalculatorOption(title: "/", backgroundColor: Color(.orange), operation: .binaryOperation({ $0 / $1 }))
        ]
        
        let secondRowOptions = [
            CalculatorOption(representable: .seven),
            CalculatorOption(representable: .eight),
            CalculatorOption(representable: .nine),
            CalculatorOption(title: "x",
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 * $1 }))
        ]
        
        let thirdRowOptions = [
            CalculatorOption(representable: .four),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .six),
            CalculatorOption(title: "-",
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 - $1 }))
        ]
        
        let fourthRowOptions = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .two),
            CalculatorOption(representable: .three),
            CalculatorOption(title: "+",
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 + $1 }))
        ]
        
        let fifthRowOptions = [
            CalculatorOption(representable: .zero, gridSpace: 2),
            CalculatorOption(title: ".", operation: .decimal),
            CalculatorOption(title: "=",
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
