//
//  CalculatorOperationValidatorMock.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/23/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

@testable import Calculator

final class CalculatorOperationValidatorMock: CalculatorOperationValidatorProtocol {
    var calculatorDisplayMaxLimit: Int
    
    init(calculatorDisplayMaxLimit: Int) {
        self.calculatorDisplayMaxLimit = calculatorDisplayMaxLimit
    }

    var shouldProcessCalculatorButtonReturnValue = true
    func shouldProcessCalculatorButton(_ calculatorButton: CalculatorButtonProtocol, in calculatorDisplay: String) -> Bool {
        return shouldProcessCalculatorButtonReturnValue
    }

    var areDisplayCharactersInRangeReturnValue = true
    func areDisplayCharactersInRange(for calculatorDisplay: String, and isEnteringNumbers: Bool) -> Bool {
        return areDisplayCharactersInRangeReturnValue
    }

    var isEnteringSignificantNumberReturnValue = true
    func isEnteringSignificantNumber(_ calculatorButton: CalculatorButtonProtocol, in calculatorDisplay: String) -> Bool {
        return isEnteringSignificantNumberReturnValue
    }
}
