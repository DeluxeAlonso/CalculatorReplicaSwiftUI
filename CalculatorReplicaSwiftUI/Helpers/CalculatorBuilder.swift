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
            CalculatorOption(title: "7"),
            CalculatorOption(title: "8"),
            CalculatorOption(title: "9"),
            CalculatorOption(title: "x",
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 * $1 }))
        ]
        
        let thirdRowOptions = [
            CalculatorOption(title: "4"),
            CalculatorOption(title: "5"),
            CalculatorOption(title: "6"),
            CalculatorOption(title: "-",
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 - $1 }))
        ]
        
        let fourthRowOptions = [
            CalculatorOption(title: "1"),
            CalculatorOption(title: "2"),
            CalculatorOption(title: "3"),
            CalculatorOption(title: "+",
                             backgroundColor: Color(.orange),
                             operation: .binaryOperation({ $0 + $1 }))
        ]
        
        let fifthRowOptions = [
            CalculatorOption(title: "0", gridSpace: 2),
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
