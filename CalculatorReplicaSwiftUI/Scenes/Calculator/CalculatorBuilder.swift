//
//  CalculatorBuilder.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorBuilder {
    static func buildCalculatorButtons() -> [[CalculatorButtonProtocol]] {
        let firstRowButtons = [
            CalculatorButton(representable: .clear,
                             foregroundColor: Color(.black),
                             backgroundColor: Color(.lightGray)),
            CalculatorButton(representable: .negative,
                             foregroundColor: Color(.black),
                             backgroundColor: Color(.lightGray)),
            CalculatorButton(representable: .percent,
                             foregroundColor: Color(.black),
                             backgroundColor: Color(.lightGray)),
            CalculatorButton(representable: .division,
                             backgroundColor: Color(.orange))
        ]
        
        let secondRowButtons = [
            CalculatorButton(representable: .seven),
            CalculatorButton(representable: .eight),
            CalculatorButton(representable: .nine),
            CalculatorButton(representable: .multiplication,
                             backgroundColor: Color(.orange))
        ]
        
        let thirdRowButtons = [
            CalculatorButton(representable: .four),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .six),
            CalculatorButton(representable: .subtraction,
                             backgroundColor: Color(.orange))
        ]
        
        let fourthRowButtons = [
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .two),
            CalculatorButton(representable: .three),
            CalculatorButton(representable: .sum,
                             backgroundColor: Color(.orange))
        ]
        
        let fifthRowButtons = [
            CalculatorButton(representable: .zero, gridSpace: 2),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .equal,
                             backgroundColor: Color(.orange))
        ]
        
        return [
            firstRowButtons,
            secondRowButtons,
            thirdRowButtons,
            fourthRowButtons,
            fifthRowButtons
        ]
    }
}
