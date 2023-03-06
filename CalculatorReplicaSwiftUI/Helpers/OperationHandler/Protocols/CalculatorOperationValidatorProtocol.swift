//
//  CalculatorOperationValidatorProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/19/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

protocol CalculatorOperationValidatorProtocol {
    //var calculatorDisplayMaxLimit: Int { get }

    /**
     * Only plain numbers can be repeated on our calculator result display. Any other button should only appear on display once.
     */
    func shouldProcessCalculatorButton(_ calculatorButton: CalculatorButtonProtocol,
                                       in calculatorDisplay: String) -> Bool

    /**
     * We only validate the digits limit if the user is currently entering non-operation buttons (numbers or decimal).
     */
    func areDisplayCharactersInRange(for calculatorDisplay: String,
                                     and isEnteringNumbers: Bool) -> Bool

    /**
     * Detects if the user is entering more than one zero on the left side of the number.
     */
    func isEnteringSignificantNumber(_ calculatorButton: CalculatorButtonProtocol,
                                     in calculatorDisplay: String) -> Bool
}
