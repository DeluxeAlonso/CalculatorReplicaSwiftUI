//
//  CalculatorOperationHandlerMock.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 20/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import Combine
@testable import Calculator

final class CalculatorOperationHandlerMock: CalculatorOperationHandlerProtocol {
    var calculatorDisplay = CurrentValueSubject<(String, Bool), Never>(("", false))

    private(set) var handleCalculatorButtonCallCount = 0
    func handleCalculatorButton(_ calculatorButton: Calculator.CalculatorButtonProtocol) {
        handleCalculatorButtonCallCount += 1
    }

    private(set) var deleteLastSingleDigitCallCount = 0
    func deleteLastSingleDigit() {
        deleteLastSingleDigitCallCount += 1
    }
}
