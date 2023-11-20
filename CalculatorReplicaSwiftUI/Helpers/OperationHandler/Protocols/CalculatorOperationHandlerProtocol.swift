//
//  CalculatorOperationHandlerProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Combine

protocol CalculatorOperationHandlerProtocol {
    var calculatorDisplay: CurrentValueSubject<(String, Bool), Never> { get }

    /**
     Handles the user's calculator input.

     - Parameter calculatorButton: Button selected by the user (e.g. a number or operation).
     */
    func handleCalculatorButton(_ calculatorButton: CalculatorButtonProtocol)

    /**
     Removes the last digit of the current number that is being input by the user.
     */
    func deleteLastSingleDigit()
}
