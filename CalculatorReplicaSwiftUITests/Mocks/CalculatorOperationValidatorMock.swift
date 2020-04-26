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
    var calculatorDisplayMaxLimit: Int
    var isEnteringNumbers: Bool
    var calculatorDisplay: String
    
    init(isEnteringNumbers: Bool, calculatorDisplay: String, calculatorDisplayMaxLimit: Int) {
        self.isEnteringNumbers = isEnteringNumbers
        self.calculatorDisplay = calculatorDisplay
        self.calculatorDisplayMaxLimit = calculatorDisplayMaxLimit
    }
}
