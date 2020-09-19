//
//  CalculatorTestsMockFactory.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/25/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
@testable import Calculator

struct CalculatorTestsMockFactory {
    static func createCalculatorOperationHandler() -> CalculatorOperationHandlerProtocol {
        let calculatorConfiguration = CalculatorConfigurationMock()
        let calculatorDisplayMaxLimit = calculatorConfiguration.calculatorDisplayMaxLimit
        let calculatorValidator = CalculatorOperationValidatorMock(calculatorDisplayMaxLimit: calculatorDisplayMaxLimit)
        return CalculatorOperationHadler(calculatorValidator: calculatorValidator,
                                         calculatorTrimmer: CalculatorDisplayTrimmer())
    }
    
    static func createCalculatorResultFormatter() -> CalculatorResultFormatterProtocol {
        return CalculatorResultFormatter(calculatorConfiguration: CalculatorConfigurationMock())
    }
}
