//
//  DependencyInjectionManager.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/17/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

struct DependencyInjectionManager {
    static func createCalculatorOperationHandler() -> CalculatorOperationHandlerProtocol {
        return CalculatorOperationHadler()
    }
    
    static func createCalculatorResultFormatter() -> CalculatorResultFormatterProtocol {
        return CalculatorResultFormatter()
    }
    
    static func createCalculatorEnvironmentObject() -> CalculatorEnviromentObject {
        return CalculatorEnviromentObject(calculatorButtons: CalculatorBuilder.buildCalculatorOptions(),
                                          resultFormatter: self.createCalculatorResultFormatter(),
                                          calculatorOperationHandler: self.createCalculatorOperationHandler())
    }
}
