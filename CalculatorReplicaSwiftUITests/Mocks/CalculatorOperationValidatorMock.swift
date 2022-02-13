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

    var shouldProcessCalculatorOptionReturnValue = true
    func shouldProcessCalculatorOption(_ calculatorOption: CalculatorOptionProtocol, in calculatorDisplay: String) -> Bool {
        return shouldProcessCalculatorOptionReturnValue
    }

    var areDisplayCharactersInRangeReturnValue = true
    func areDisplayCharactersInRange(for calculatorDisplay: String, and isEnteringNumbers: Bool) -> Bool {
        return areDisplayCharactersInRangeReturnValue
    }

    var isEnteringSignificantNumberReturnValue = true
    func isEnteringSignificantNumber(_ calculatorOption: CalculatorOptionProtocol, in calculatorDisplay: String) -> Bool {
        return isEnteringSignificantNumberReturnValue
    }
}
