//
//  CalculatorOperationHandler.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class CalculatorOperationHadler: CalculatorOperationHandlerProtocol {

    private let calculatorValidator: CalculatorOperationValidatorProtocol
    private var pendingBinaryOperation: PendingBinaryOperation?
    private var resultValue: Double? = nil

    var isEnteringNumbers: Bool = false
    var calculatorDisplay: String = "0" {
        didSet {
            delegate?.updateValue(calculatorDisplay, isEnteringNumbers: isEnteringNumbers)
        }
    }
    
    weak var delegate: CalculatorEnvironmentObjectProtocol?
    
    // MARK: - Initializers
    
    init(calculatorConfiguration: CalculatorConfigurationProtocol,
         calculatorValidator: CalculatorOperationValidatorProtocol) {
        self.calculatorValidator = calculatorValidator
    }
    
    // MARK: - CalculatorOperationHandlerProtocol
    
    func handleCalculatorOption(_ calculatorOption: CalculatorOptionProtocol) {
        if calculatorOption.shouldShowOnResultDisplay {
            updateResultDisplay(calculatorOption)
        } else {
            performOperation(calculatorOption)
        }
    }
    
    // MARK: - Calculator Operations
    
    private func updateResultDisplay(_ calculatorOption: CalculatorOptionProtocol) {
        clearCalculatorDisplayIfNeeded()
        guard calculatorValidator.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay),
            calculatorValidator.isEnteringSignificantNumber(calculatorOption, in: calculatorDisplay),
            calculatorValidator.areDisplayCharactersInRange(for: calculatorDisplay, and: isEnteringNumbers) else {
                return
        }
        isEnteringNumbers = true
        calculatorDisplay = getTrimmedCalculatorDisplay(with: calculatorOption)
    }
    
    private func performOperation(_ calculatorOption: CalculatorOptionProtocol) {
        guard let operation = calculatorOption.operation else { return }
        // We set isEnteringNumbers to false when performing any operation except decimal.
        isEnteringNumbers = false
        let resultValueUpdated = calculatorDisplay.toDouble()
        switch operation {
        case .clear:
            clearDisplay()
        case .unaryOperation(let function):
            updateResultValue(with: function(resultValueUpdated),
                              shouldResetValueAfterDisplay: false)
        case .binaryOperation(let function):
            pendingBinaryOperation = PendingBinaryOperation(function: function,
                                                            firstOperand: resultValueUpdated)
            resetResultValue()
        case .decimal:
            break
        case .equals:
            updateResultValue(with: performPendingBinaryOperation(with: resultValueUpdated))
        }
    }
    
    private func clearDisplay() {
        resetResultValue()
        calculatorDisplay = "0"
        pendingBinaryOperation = nil
    }
    
    private func performPendingBinaryOperation(with resultValue: Double) -> Double {
        guard let pendingBinaryOperation = pendingBinaryOperation else { return 0 }
        if !pendingBinaryOperation.hasOperand {
            pendingBinaryOperation.setOperand(resultValue)
        }
        return pendingBinaryOperation.perform()
    }
    
    private func resetResultValue() {
        resultValue = nil
    }
    
    // MARK: - Utils

    private func updateResultValue(with newValue: Double, shouldResetValueAfterDisplay: Bool = true) {
        resultValue = newValue
        updateDisplay(with: self.resultValue!)
        if shouldResetValueAfterDisplay {
            resetResultValue()
        }
    }
    
    private func updateDisplay(with resultValue: Double) {
        let isInteger = !String(resultValue).hasDecimal() && Double(Int.min)...Double(Int.max) ~= resultValue
        let valueToDisplay: CustomStringConvertible = isInteger ? Int(resultValue) : resultValue
        calculatorDisplay = String(valueToDisplay.description)
    }
    
    /**
     * If we have just applied an operation, we clear the calculator display string.
     */
    private func clearCalculatorDisplayIfNeeded() {
        if resultValue == nil && !isEnteringNumbers {
            calculatorDisplay = ""
        }
    }
    
    private func getTrimmedCalculatorDisplay(with calculatorOption: CalculatorOptionProtocol) -> String {
        let newCalculatorDisplay = calculatorDisplay + calculatorOption.title
        var trimmedCalculatorDisplay = newCalculatorDisplay.trimLeadingOcurrencesOf(CalculatorOptionRepresentable.zero.character)
        if trimmedCalculatorDisplay.first == CalculatorOptionRepresentable.decimal.character {
            trimmedCalculatorDisplay.insert(CalculatorOptionRepresentable.zero.character, at: trimmedCalculatorDisplay.startIndex)
        }
        
        return trimmedCalculatorDisplay
    }
    
}
