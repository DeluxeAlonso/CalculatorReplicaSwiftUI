//
//  CalculatorResultFormatterMock.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 20/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import Combine
@testable import Calculator

final class CalculatorResultFormatterMock: CalculatorResultFormatterProtocol {
    var formatResultResult: String?
    private(set) var formatResultCallCount = 0
    var formatResultCall: ((String) -> Void)?
    func formatResult(from calculatorDisplay: String) -> String? {
        formatResultCallCount += 1
        formatResultCall?(calculatorDisplay)
        return formatResultResult
    }

    var formatEnteredNumberResult: String?
    private(set) var formatEnteredNumberCallCount = 0
    var formatEnteredNumberCall: ((String) -> Void)?
    func formatEnteredNumber(from calculatorDisplay: String) -> String? {
        formatEnteredNumberCallCount += 1
        formatEnteredNumberCall?(calculatorDisplay)
        return formatEnteredNumberResult
    }
}
