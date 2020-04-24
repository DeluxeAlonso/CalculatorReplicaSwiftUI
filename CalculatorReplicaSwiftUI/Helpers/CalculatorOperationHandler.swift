//
//  CalculatorOperationHandler.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class CalculatorOperationHadler: CalculatorOperationHandlerProtocol, CalculatorOperationValidatorProtocol {

    private var resultValue: Double = 0
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    weak var delegate: CalculatorEnvironmentObjectProtocol?
    
    var isEnteringNumbers: Bool = false
    var calculatorDisplay: String = "" {
        didSet {
            delegate?.updateValue(calculatorDisplay, isEnteringNumbers: isEnteringNumbers)
        }
    }
    
    // MARK: - Initializers
    
    init() {}
    
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
        guard shouldProcessCalculatorOption(calculatorOption),
            isEnteringSignificantNumber(calculatorOption),
            areDisplayCharactersInRange() else {
                return
        }
        isEnteringNumbers = true
        calculatorDisplay = getTrimmedCalculatorDisplay(with: calculatorOption)
    }
    
    private func performOperation(_ calculatorOption: CalculatorOptionProtocol) {
        guard let operation = calculatorOption.operation else { return }
        // We set isEnteringNumbers to false when performing any operation except decimal.
        isEnteringNumbers = operation == .decimal
        updateResultValue()
        switch operation {
        case .clear:
            clearDisplay()
        case .unaryOperation(let function):
            resultValue = function(resultValue)
            updateDisplay()
        case .binaryOperation(let function):
            pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: resultValue)
            resultValue = 0
        case .decimal:
            break
        case .equals:
            performPendingBinaryOperation()
            updateDisplay()
            resultValue = 0
        }
    }
    
    private func clearDisplay() {
        resultValue = 0
        updateDisplay()
        pendingBinaryOperation = nil
    }
    
    private func performPendingBinaryOperation() {
        guard let pendingBinaryOperation = pendingBinaryOperation else { return }
        if !pendingBinaryOperation.hasOperand {
            pendingBinaryOperation.setOperand(resultValue)
        }
        resultValue = pendingBinaryOperation.perform()
    }
    
    // MARK: - Utils
    
    private func updateDisplay() {
        let isInteger = !String(resultValue).hasDecimal() && resultValue < Double(Int.max)
        let valueToDisplay: CustomStringConvertible = isInteger ? Int(resultValue) : resultValue
        calculatorDisplay = String(valueToDisplay.description)
    }
    
    private func updateResultValue() {
        guard let value = Double(calculatorDisplay) else { return }
        resultValue = value
    }
    
    /**
    * If we have just applied an operation, we clear the calculator display string.
    */
    private func clearCalculatorDisplayIfNeeded() {
        if resultValue == .zero && !isEnteringNumbers {
            calculatorDisplay = ""
        }
    }
    
    private func getTrimmedCalculatorDisplay(with calculatorOption: CalculatorOptionProtocol) -> String {
        let newCalculatorDisplay = calculatorDisplay + calculatorOption.title
        var trimmedCalculatorDisplay = newCalculatorDisplay.trimLeadingOcurrencesOf("0")
        if trimmedCalculatorDisplay.first == "." {
            trimmedCalculatorDisplay.insert("0", at: trimmedCalculatorDisplay.startIndex)
        }
        
        return trimmedCalculatorDisplay
    }
    
}
