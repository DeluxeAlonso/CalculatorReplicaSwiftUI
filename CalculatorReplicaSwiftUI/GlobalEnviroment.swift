//
//  GlobalEnviroment.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Combine

class GlobalEnviroment: ObservableObject {
    @Published var calculatorDisplay: String = ""
    
    let calculatorButtons: [[CalculatorOption]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .dot, .equals]
    ]
    
    var numberOfButtonsPerRow: Int? {
        return calculatorButtons.first?.count
    }
    
    func updateCalculatorDisplay(calculatorOption: CalculatorOption) {
        calculatorDisplay = calculatorOption.title
    }
}
