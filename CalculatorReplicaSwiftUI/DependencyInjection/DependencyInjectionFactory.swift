//
//  DependencyInjectionManager.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/17/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

struct DependencyInjectionFactory {
    static func createCalculatorConfiguration() -> CalculatorConfigurationProtocol {
        CalculatorConfiguration()
    }
    
    static func createCalculatorValidator() -> CalculatorOperationValidatorProtocol {
        let calculatorConfiguration = createCalculatorConfiguration()
        return CalculatorOperationValidator(calculatorConfiguration: calculatorConfiguration)
    }
    
    static func createCalculatorTrimmer() -> CalculatorDisplayTrimmerProtocol {
        CalculatorDisplayTrimmer()
    }
    
    static func createCalculatorOperationHandler() -> CalculatorOperationHandlerProtocol {
        CalculatorOperationHadler(calculatorValidator: createCalculatorValidator(),
                                  calculatorTrimmer: createCalculatorTrimmer())
    }
    
    static func createCalculatorResultFormatter() -> CalculatorResultFormatterProtocol {
        CalculatorResultFormatter(calculatorConfiguration: createCalculatorConfiguration())
    }
    
    static func createCalculatorEnvironmentObject() -> CalculatorEnvironmentObject {
        CalculatorEnvironmentObject(calculatorButtons: CalculatorBuilder.buildCalculatorButtons(),
                                    resultFormatter: createCalculatorResultFormatter(),
                                    calculatorOperationHandler: createCalculatorOperationHandler())
    }
}
