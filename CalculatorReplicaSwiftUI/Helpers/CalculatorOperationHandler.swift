//
//  CalculatorOperationHandler.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Combine
import SwiftUI

class CalculatorOperationHadler: CalculatorOperationHandlerProtocol {

    private var resultValue: Double = 0
    private var pendingBinaryOperation: PendingBinaryOperation?
    private var isEnteringNumbers: Bool = false
    
    weak var delegate: CalculatorEnvironmentObjectProtocol?
    
    private var areDisplayCharactersInRange: Bool {
        return calculatorDisplay.filter { $0.isNumber }.count < Constants.calculatorDisplayMaxLimit
    }
    
    private var calculatorDisplay: String = "0" {
        didSet {
            delegate?.updateValue(calculatorDisplay)
        }
    }
    
    init() {}
    
    // MARK: - Public
    
    func handleCalculatorOption(_ calculatorOption: CalculatorOptionProtocol) {
        if calculatorOption.shouldShowOnResultDisplay {
            updateResultDisplay(calculatorOption)
        } else {
            performOperation(calculatorOption)
        }
    }
    
    // MARK: - Utils
    
    private func updateDisplay() {
        let valueToDisplay: CustomStringConvertible = resultValue.hasDecimals ? resultValue : Int(resultValue)
        calculatorDisplay = String(valueToDisplay.description)
    }
    
    private func updateResultValue() {
        guard let value = Double(calculatorDisplay) else { return }
        resultValue = value
    }
    
    // MARK: - Calculator Operations
    
    private func isOptionAlreadyPresent(_ calculatorOption: CalculatorOptionProtocol) -> Bool {
        return calculatorDisplay.contains(calculatorOption.title)
    }
    
    private func updateResultDisplay(_ calculatorOption: CalculatorOptionProtocol) {
        if !calculatorOption.isPlainNumber, isOptionAlreadyPresent(calculatorOption) { return }
        if isEnteringNumbers, !areDisplayCharactersInRange { return }
        if resultValue == .zero && !isEnteringNumbers { calculatorDisplay = "" }
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

}
