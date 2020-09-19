//
//  DependencyInjectionManager.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/17/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

struct DependencyInjectionManager {
    static func createCalculatorConfiguration() -> CalculatorConfigurationProtocol {
        return CalculatorConfiguration()
    }
    
    static func createCalculatorValidator() -> CalculatorOperationValidatorProtocol {
        let calculatorConfiguration = createCalculatorConfiguration()
        return CalculatorOperationValidator(calculatorDisplayMaxLimit: calculatorConfiguration.calculatorDisplayMaxLimit)
    }
    
    static func createCalculatorTrimmer() -> CalculatorDisplayTrimmerProtocol {
        return CalculatorDisplayTrimmer()
    }
    
    static func createCalculatorOperationHandler() -> CalculatorOperationHandlerProtocol {
        return CalculatorOperationHadler(calculatorValidator: createCalculatorValidator(),
                                         calculatorTrimmer: createCalculatorTrimmer())
    }
    
    static func createCalculatorResultFormatter() -> CalculatorResultFormatterProtocol {
        return CalculatorResultFormatter(calculatorConfiguration: createCalculatorConfiguration())
    }
    
    static func createCalculatorEnvironmentObject() -> CalculatorEnviromentObject {
        return CalculatorEnviromentObject(calculatorButtons: CalculatorBuilder.buildCalculatorOptions(),
                                          resultFormatter: self.createCalculatorResultFormatter(),
                                          calculatorOperationHandler: self.createCalculatorOperationHandler())
    }
}
