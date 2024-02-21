//
//  CalculatorOperationValidator.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/26/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

struct CalculatorOperationValidator: CalculatorOperationValidatorProtocol {
    private let calculatorConfiguration: CalculatorConfigurationProtocol

    // MARK: - Initializers

    init(calculatorConfiguration: CalculatorConfigurationProtocol) {
        self.calculatorConfiguration = calculatorConfiguration
    }

    // MARK: - CalculatorOperationValidatorProtocol

    func shouldProcessCalculatorButton(_ calculatorButton: CalculatorButtonProtocol,
                                       in calculatorDisplay: String) -> Bool {
        guard calculatorButton.shouldShowOnResultDisplay else { return false }
        if !calculatorButton.isPlainNumber {
            return !calculatorDisplay.contains(calculatorButton.title)
        }
        return true
    }

    func areDisplayCharactersInRange(for calculatorDisplay: String,
                                     and isEnteringNumbers: Bool) -> Bool {
        guard isEnteringNumbers else { return true }
        return calculatorDisplay.filter { $0.isNumber }.count < calculatorConfiguration.calculatorDisplayMaxLimit
    }

    func isEnteringSignificantNumber(_ calculatorButton: CalculatorButtonProtocol,
                                     in calculatorDisplay: String) -> Bool {
        guard calculatorButton.title == CalculatorButtonRepresentable.zero.rawValue else { return true }
        let numberOfZeros = calculatorDisplay.extractLastCharactersOf(.zero).count
        return !(numberOfZeros == calculatorDisplay.count && numberOfZeros > 0)
    }
}
