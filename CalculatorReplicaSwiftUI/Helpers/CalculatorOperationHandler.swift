//
//  CalculatorOperationHandler.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class CalculatorOperationHadler: CalculatorOperationHandlerProtocol {

    private var resultValue: Double = 0
    private var isEnteringNumbers: Bool = false
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    weak var delegate: CalculatorEnvironmentObjectProtocol?
    
    private var calculatorDisplay: String = "" {
        didSet {
            delegate?.updateValue(calculatorDisplay)
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
        guard shouldProcessCalculatorOption(calculatorOption), areDisplayCharactersInRange() else { return }
        clearCalculatorDisplayIfNeeded()
        calculatorDisplay += calculatorOption.title
        isEnteringNumbers = true
    }
    
    private func performOperation(_ calculatorOption: CalculatorOptionProtocol) {
        guard let operation = calculatorOption.operation else { return }
        isEnteringNumbers = false
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
        if !pendingBinaryOperation.hasSecondOperand {
            pendingBinaryOperation.setSecondOperand(resultValue)
        }
        resultValue = pendingBinaryOperation.perform()
    }
    
    // MARK: - Utils
    
    private func updateDisplay() {
        let isInteger = String(resultValue).fractionDigitsCount() == 0 && resultValue < Double(Int.max)
        let valueToDisplay: CustomStringConvertible = isInteger ? Int(resultValue) : resultValue
        calculatorDisplay = String(valueToDisplay.description)
    }
    
    private func updateResultValue() {
        guard let value = Double(calculatorDisplay) else { return }
        resultValue = value
    }
    
    /**
    * Only plain numbers can be repeated on our calculator result display. Any other option should only appear once.
    */
    private func shouldProcessCalculatorOption(_ calculatorOption: CalculatorOptionProtocol) -> Bool {
        if !calculatorOption.isPlainNumber, calculatorDisplay.contains(calculatorOption.title) {
            return false
        }
        return true
    }
    
    /**
    * We only validate the digits limit if the user is currently entering non-operation options (numbers or decimal).
    */
    private func areDisplayCharactersInRange() -> Bool {
        guard isEnteringNumbers else { return true }
        return calculatorDisplay.filter { $0.isNumber }.count < CalculatorConstants.calculatorDisplayMaxLimit
    }
    
    /**
    * If we have just applied an operation, we clear the calculator display string.
    */
    private func clearCalculatorDisplayIfNeeded() {
        if resultValue == .zero && !isEnteringNumbers { calculatorDisplay = "" }
    }

}
