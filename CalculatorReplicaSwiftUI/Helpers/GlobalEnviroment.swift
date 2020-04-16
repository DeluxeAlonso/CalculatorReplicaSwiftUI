//
//  GlobalEnviroment.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
import Combine

class GlobalEnviroment: ObservableObject {
    @Published var formattedCalculatorDisplay: String = "0"
    
    private let resultFormatter: CalculatorResultFormatterProtocol
    let calculatorButtons: [[CalculatorOptionProtocol]]
    
    private var resultValue: Double = 0
    private var pendingBinaryOperation: PendingBinaryOperation?
    private var isEnteringNumbers: Bool = false
    
    private var areDisplayCharactersInRange: Bool {
        return calculatorDisplay.filter { $0.isNumber }.count < Constants.calculatorDisplayMaxLimit
    }
    
    private var calculatorDisplay: String = "0" {
        didSet {
            guard let formattedResult = resultFormatter.formatResult(from: calculatorDisplay) else {
                return
            }
            formattedCalculatorDisplay = formattedResult
        }
    }
    
    var numberOfButtonsPerRow: Int? {
        return calculatorButtons.first?.count
    }
    
    // MARK: - Initializers
    
    init(calculatorButtons: [[CalculatorOptionProtocol]], resultFormatter: CalculatorResultFormatterProtocol) {
        self.calculatorButtons = calculatorButtons
        self.resultFormatter = resultFormatter
    }
    
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
        let isInteger = resultValue.truncatingRemainder(dividingBy: 1) == 0 && resultValue < Double(Int.max)
        let valueToDisplay: CustomStringConvertible = isInteger ? Int(resultValue) : resultValue
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
            handleDecimalInput(calculatorOption: calculatorOption)
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
    
    private func handleDecimalInput(calculatorOption: CalculatorOptionProtocol) {
        guard !calculatorDisplay.contains(calculatorOption.title) else { return }
        calculatorDisplay += calculatorOption.title
    }

}
