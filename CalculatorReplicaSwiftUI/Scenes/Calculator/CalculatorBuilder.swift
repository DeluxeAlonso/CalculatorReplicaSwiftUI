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
                             foregroundColor: Color(.black),
                             backgroundColor: Color(.lightGray)),
            CalculatorOption(representable: .negative,
                             foregroundColor: Color(.black),
                             backgroundColor: Color(.lightGray)),
            CalculatorOption(representable: .percent,
                             foregroundColor: Color(.black),
                             backgroundColor: Color(.lightGray)),
            CalculatorOption(representable: .division,
                             backgroundColor: Color(.orange))
        ]
        
        let secondRowOptions = [
            CalculatorOption(representable: .seven),
            CalculatorOption(representable: .eight),
            CalculatorOption(representable: .nine),
            CalculatorOption(representable: .multiplication,
                             backgroundColor: Color(.orange))
        ]
        
        let thirdRowOptions = [
            CalculatorOption(representable: .four),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .six),
            CalculatorOption(representable: .subtraction,
                             backgroundColor: Color(.orange))
        ]
        
        let fourthRowOptions = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .two),
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .sum,
                             backgroundColor: Color(.orange))
        ]
        
        let fifthRowOptions = [
            CalculatorOption(representable: .zero, gridSpace: 2),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .equal,
                             backgroundColor: Color(.orange))
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
