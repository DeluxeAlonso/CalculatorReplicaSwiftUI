//
//  CalculatorEnvironmentObject.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
import Combine

class CalculatorEnvironmentObject: ObservableObject, CalculatorEnvironmentObjectProtocol {

    @UserDefaultsStorage("calculatorDisplay", defaultValue: "0")
    var formattedCalculatorDisplay: String {
        willSet {
            objectWillChange.send()
        }
    }
    
    let calculatorButtons: [[CalculatorOptionProtocol]]
    private let resultFormatter: CalculatorResultFormatterProtocol
    private var calculatorOperationHandler: CalculatorOperationHandlerProtocol
    
    // MARK: - Initializers
    
    init(calculatorButtons: [[CalculatorOptionProtocol]],
         resultFormatter: CalculatorResultFormatterProtocol,
         calculatorOperationHandler: CalculatorOperationHandlerProtocol) {
        self.calculatorButtons = calculatorButtons
        self.resultFormatter = resultFormatter
        self.calculatorOperationHandler = calculatorOperationHandler
        self.calculatorOperationHandler.delegate = self
    }
    
    // MARK: - Public
    
    func handleCalculatorOption(_ calculatorOption: CalculatorOptionProtocol) {
        calculatorOperationHandler.handleCalculatorOption(calculatorOption)
    }

    func deleteLastSingleDigit() {
        calculatorOperationHandler.deleteLastSingleDigit()
    }
    
    // MARK: - CalculatorEnvironmentObjectProtocol
    
    func updateValue(_ value: String, isEnteringNumbers: Bool) {
        if isEnteringNumbers {
            guard let formattedResult = resultFormatter.formatEnteredNumber(from: value) else { return }
            formattedCalculatorDisplay = formattedResult
        } else {
            guard let formattedResult = resultFormatter.formatResult(from: value) else { return }
            formattedCalculatorDisplay = formattedResult
        }
    }
    
}
