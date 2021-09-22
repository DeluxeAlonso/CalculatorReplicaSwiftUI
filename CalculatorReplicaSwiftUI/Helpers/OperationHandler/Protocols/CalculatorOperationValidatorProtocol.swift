//
//  CalculatorOperationValidatorProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/19/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

protocol CalculatorOperationValidatorProtocol {
    var calculatorDisplayMaxLimit: Int { get }

    /**
     * Only plain numbers can be repeated on our calculator result display. Any other option should only appear once.
     */
    func shouldProcessCalculatorOption(_ calculatorOption: CalculatorOptionProtocol,
                                       in calculatorDisplay: String) -> Bool

    /**
     * We only validate the digits limit if the user is currently entering non-operation options (numbers or decimal).
     */
    func areDisplayCharactersInRange(for calculatorDisplay: String,
                                     and isEnteringNumbers: Bool) -> Bool

    /**
     * Detects if the user is entering more than one zero on the left side of the number.
     */
    func isEnteringSignificantNumber(_ calculatorOption: CalculatorOptionProtocol,
                                     in calculatorDisplay: String) -> Bool
}

extension CalculatorOperationValidatorProtocol {
    /**
     * Only plain numbers can be repeated on our calculator result display. Any other option should only appear once.
     */
    func shouldProcessCalculatorOption(_ calculatorOption: CalculatorOptionProtocol,
                                       in calculatorDisplay: String) -> Bool {
        guard calculatorOption.shouldShowOnResultDisplay else { return false }
        if !calculatorOption.isPlainNumber {
            return !calculatorDisplay.contains(calculatorOption.title)
        }
        return true
    }
    
    /**
     * We only validate the digits limit if the user is currently entering non-operation options (numbers or decimal).
     */
    func areDisplayCharactersInRange(for calculatorDisplay: String,
                                     and isEnteringNumbers: Bool) -> Bool {
        guard isEnteringNumbers else { return true }
        return calculatorDisplay.filter { $0.isNumber }.count < calculatorDisplayMaxLimit
    }
    
    /**
     * Detects if the user is entering more than one zero on the left side of the number.
     */
    func isEnteringSignificantNumber(_ calculatorOption: CalculatorOptionProtocol,
                                     in calculatorDisplay: String) -> Bool {
        guard calculatorOption.title == "0" else { return true }
        let numberOfZeros = calculatorDisplay.extractLastCharactersOf("0").count
        return !(numberOfZeros == calculatorDisplay.count && numberOfZeros > 0)
    }
}

