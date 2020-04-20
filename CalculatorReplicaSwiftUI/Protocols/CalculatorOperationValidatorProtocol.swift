//
//  CalculatorOperationValidatorProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/19/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

protocol CalculatorOperationValidatorProtocol {
    var isEnteringNumbers: Bool { get set }
    var calculatorDisplay: String { get set }
}

extension CalculatorOperationValidatorProtocol {
    /**
     * Only plain numbers can be repeated on our calculator result display. Any other option should only appear once.
     */
    func shouldProcessCalculatorOption(_ calculatorOption: CalculatorOptionProtocol) -> Bool {
        if !calculatorOption.isPlainNumber {
            if calculatorDisplay.contains(calculatorOption.title) {
                return false
            } else {
                return true
            }
        }
        return true
    }
    
    /**
     * We only validate the digits limit if the user is currently entering non-operation options (numbers or decimal).
     */
    func areDisplayCharactersInRange() -> Bool {
        guard isEnteringNumbers else { return true }
        return calculatorDisplay.filter { $0.isNumber }.count < CalculatorConstants.calculatorDisplayMaxLimit
    }
    
    /**
     * Detects if the user is entering more than one zero on the left side of the number.
     */
    func isEnteringSignificantNumber(_ calculatorOption: CalculatorOptionProtocol) -> Bool {
        guard calculatorOption.title == "0" else { return true }
        let numberOfZeros = calculatorDisplay.extractLastCharactersOf("0").count
        return !(numberOfZeros == calculatorDisplay.count && numberOfZeros > 1)
    }
}

