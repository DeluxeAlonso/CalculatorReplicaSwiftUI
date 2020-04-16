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
    
    lazy var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 9
        return numberFormatter
    }()
    
    lazy var scientificFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .scientific
        numberFormatter.maximumIntegerDigits = 1
        numberFormatter.maximumFractionDigits = 5
        return numberFormatter
    }()
    
    var calculatorDisplay: String = "0" {
        didSet {
            formatResultValue(calculatorDisplay)
        }
    }
    
    private var resultValue: Double = 0
    
    let calculatorButtons: [[CalculatorOptionProtocol]]
    
    var isEnteringNumbers: Bool = false
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    var numberOfButtonsPerRow: Int? {
        return calculatorButtons.first?.count
    }
    
    private var areDisplayCharactersInRange: Bool {
        return calculatorDisplay.filter { $0.isNumber }.count < Constants.maxLimit
    }
    
    // MARK: - Initializers
    
    init(calculatorButtons: [[CalculatorOptionProtocol]]) {
        self.calculatorButtons = calculatorButtons
    }
    
    // MARK: - Utils
    
    func updateDisplay() {
        let isInteger = resultValue.truncatingRemainder(dividingBy: 1) == 0 && resultValue < Double(Int.max)
        let valueToDisplay: CustomStringConvertible = isInteger ? Int(resultValue) : resultValue
        calculatorDisplay = String(valueToDisplay.description)
    }
    
    func updateResultValue() {
        guard let value = Double(calculatorDisplay) else { return }
        resultValue = value
    }
    
    // MARK: - Calculator Operations
    
    func isOptionAlreadyPresent(_ calculatorOption: CalculatorOptionProtocol) -> Bool {
        return calculatorDisplay.contains(calculatorOption.title)
    }
    
    func handleCalculatorOption(_ calculatorOption: CalculatorOptionProtocol) {
        if calculatorOption.shouldShowOnResultDisplay {
            updateResultDisplay(calculatorOption)
        } else {
            performOperation(calculatorOption)
        }
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
    
    // MARK: - Result formatter
    
    private func formatResultValue(_ calculatorDisplay: String) {
        guard let largeNumber = Double(calculatorDisplay) else { return}
        let exceedDecimalLimit = largeNumber.decimalCount() > Constants.maxLimit
        let exceedNumberLimit = largeNumber >= 1_000_000_000
        let needsScientificFormat = exceedNumberLimit || exceedDecimalLimit
        let formatter = needsScientificFormat ? scientificFormatter : numberFormatter
        if let formattedNumber = formatter.string(from: NSNumber(value:largeNumber)) {
            formattedCalculatorDisplay = formattedNumber
        }
    }

}

// MARK: - PendingBinaryOperation

extension GlobalEnviroment {
    class PendingBinaryOperation {
        let function: (Double, Double) -> Double
        var firstOperand: Double
        var secondOperand: Double? = nil
        
        init(function: @escaping (Double, Double) -> Double, firstOperand: Double) {
            self.function = function
            self.firstOperand = firstOperand
        }
        
        var hasSecondOperand: Bool {
            return secondOperand != nil
        }
        
        func setSecondOperand(_ secondOperand: Double) {
            self.secondOperand = secondOperand
        }
        
        func perform() -> Double {
            guard let secondOperand = secondOperand else { return 0 }
            let value = function(firstOperand, secondOperand)
            firstOperand = value
            return value
        }
    }
}

// MARK: - Constants

extension GlobalEnviroment {
    struct Constants {
        static let maxLimit = 9
    }
}
