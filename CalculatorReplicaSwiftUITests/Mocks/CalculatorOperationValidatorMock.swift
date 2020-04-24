//
//  CalculatorOperationValidatorMock.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/23/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
@testable import Calculator

class CalculatorOperationValidatorMock: CalculatorOperationValidatorProtocol {
    var isEnteringNumbers: Bool
    var calculatorDisplay: String
    
    init(isEnteringNumbers: Bool, calculatorDisplay: String) {
        self.isEnteringNumbers = isEnteringNumbers
        self.calculatorDisplay = calculatorDisplay
    }
}
