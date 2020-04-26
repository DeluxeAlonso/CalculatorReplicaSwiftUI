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
        return CalculatorOperationHadler(calculatorConfiguration: CalculatorConfigurationMock())
    }
    
    static func createCalculatorResultFormatter() -> CalculatorResultFormatterProtocol {
        return CalculatorResultFormatter(calculatorConfiguration: CalculatorConfigurationMock())
    }
}
