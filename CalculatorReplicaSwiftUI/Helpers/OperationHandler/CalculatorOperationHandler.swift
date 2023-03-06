//
//  CalculatorOperationHandler.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

class CalculatorOperationHadler: CalculatorOperationHandlerProtocol {
    // MARK: - Dependencies

    private let calculatorValidator: CalculatorOperationValidatorProtocol
    private let calculatorTrimmer: CalculatorDisplayTrimmerProtocol

    // MARK: - Stored properties

    private var pendingBinaryOperation: PendingBinaryOperation?
    private var isEnteringNumbers: Bool = false

    // MARK: - Computed properties
    
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
    
    func handleCalculatorButton(_ calculatorButton: CalculatorButtonProtocol) {
        if calculatorButton.shouldShowOnResultDisplay {
            updateResultDisplay(calculatorButton)
        } else {
            performOperation(calculatorButton)
        }
    }

    func deleteLastSingleDigit() {
        guard isEnteringNumbers else { return }

        let newCalculatorDisplay = String(calculatorDisplay.dropLast())
        if newCalculatorDisplay.isEmpty {
            calculatorDisplay = CalculatorButtonRepresentable.zero.rawValue
        } else {
            calculatorDisplay = newCalculatorDisplay
        }
    }
    
    // MARK: - Calculator Operations
    
    private func updateResultDisplay(_ calculatorButton: CalculatorButtonProtocol) {
        clearCalculatorDisplayIfNeeded()
        guard calculatorValidator.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay),
            calculatorValidator.isEnteringSignificantNumber(calculatorButton, in: calculatorDisplay),
            calculatorValidator.areDisplayCharactersInRange(for: calculatorDisplay, and: isEnteringNumbers) else {
                return
        }
        isEnteringNumbers = true
        let newCalculatorDisplay = calculatorDisplay + calculatorButton.title
        calculatorDisplay = calculatorTrimmer.getTrimmedCalculatorDisplay(newCalculatorDisplay)
    }
    
    private func performOperation(_ calculatorButton: CalculatorButtonProtocol) {
        guard let operation = calculatorButton.operation else { return }
        // We set isEnteringNumbers to false when performing any operation except decimal.
        isEnteringNumbers = operation == .decimal
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
            guard let newValue = performPendingBinaryOperation(with: resultValueUpdated) else {
                return
            }
            updateDisplay(with: newValue)
        }
    }
    
    private func performPendingBinaryOperation(with resultValue: Double) -> Double? {
        guard let pendingBinaryOperation = pendingBinaryOperation else { return nil }
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
        calculatorDisplay = CalculatorButtonRepresentable.zero.rawValue
    }
    
    private func clearPendingBinaryOperation() {
        pendingBinaryOperation = nil
    }
    
    private func clearCalculator() {
        clearCalculatorDisplay()
        clearPendingBinaryOperation()
    }
}
