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
    private let calculatorTrimmer: CalculatorDisplayTrimmerProtocol
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    var isEnteringNumbers: Bool = false
    var calculatorDisplay: String = "" {
        didSet {
            delegate?.updateValue(calculatorDisplay, isEnteringNumbers: isEnteringNumbers)
        }
    }
    
    weak var delegate: CalculatorEnvironmentObjectProtocol?
    
    // MARK: - Initializers
    
    init(calculatorValidator: CalculatorOperationValidatorProtocol,
         calculatorTrimmer: CalculatorDisplayTrimmerProtocol) {
        self.calculatorValidator = calculatorValidator
        self.calculatorTrimmer = calculatorTrimmer
    }
    
    // MARK: - CalculatorOperationHandlerProtocol
    
    func handleCalculatorOption(_ calculatorOption: CalculatorOptionProtocol) {
        if calculatorOption.shouldShowOnResultDisplay {
            updateResultDisplay(calculatorOption)
        } else {
            performOperation(calculatorOption)
        }
    }

    func deleteLastSingleDigit() {
        let newCalculatorDisplay = String(calculatorDisplay.dropLast())
        if newCalculatorDisplay.isEmpty {
            calculatorDisplay = CalculatorOptionRepresentable.zero.rawValue
        } else {
            calculatorDisplay = newCalculatorDisplay
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
        let newCalculatorDisplay = calculatorDisplay + calculatorOption.title
        calculatorDisplay = calculatorTrimmer.getTrimmedCalculatorDisplay(newCalculatorDisplay)
    }
    
    private func performOperation(_ calculatorOption: CalculatorOptionProtocol) {
        guard let operation = calculatorOption.operation else { return }
        // We set isEnteringNumbers to false when performing any operation except decimal.
        isEnteringNumbers = false
        let resultValueUpdated = calculatorDisplay.toDouble()
        switch operation {
        case .clear:
            clearCalculator()
        case .unaryOperation(let function):
            updateDisplay(with: function(resultValueUpdated))
        case .binaryOperation(let function):
            pendingBinaryOperation = PendingBinaryOperation(function: function,
                                                            firstOperand: resultValueUpdated)
        case .decimal:
            break
        case .equals:
            let newValue = performPendingBinaryOperation(with: resultValueUpdated)
            updateDisplay(with: newValue)
        }
    }
    
    private func performPendingBinaryOperation(with resultValue: Double) -> Double {
        guard let pendingBinaryOperation = pendingBinaryOperation else { return 0 }
        if !pendingBinaryOperation.hasOperand {
            pendingBinaryOperation.setOperand(resultValue)
        }
        return pendingBinaryOperation.perform()
    }
    
    private func updateDisplay(with resultValue: Double) {
        let isInteger = !String(resultValue).hasDecimal() && Double(Int.min)...Double(Int.max) ~= resultValue
        let valueToDisplay: CustomStringConvertible = isInteger ? Int(resultValue) : resultValue
        calculatorDisplay = String(valueToDisplay.description)
    }
    
    // MARK: - Clear methods
    
    /**
     * If we have just applied an operation, we clear the calculator display string.
     */
    private func clearCalculatorDisplayIfNeeded() {
        guard !isEnteringNumbers else { return }
        clearCalculatorDisplay()
    }
    
    private func clearCalculatorDisplay() {
        calculatorDisplay = CalculatorOptionRepresentable.zero.rawValue
    }
    
    private func clearPendingBinaryOperation() {
        pendingBinaryOperation = nil
    }
    
    private func clearCalculator() {
        clearCalculatorDisplay()
        clearPendingBinaryOperation()
    }
    
}
