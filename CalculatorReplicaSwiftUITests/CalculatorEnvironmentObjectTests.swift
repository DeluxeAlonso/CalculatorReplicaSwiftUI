//
//  CalculatorEnvironmentObjectTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 20/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

final class CalculatorEnvironmentObjectTests: XCTestCase {

    private var calculatorEnvironmentObject: CalculatorEnvironmentObject!
    private var resultFormatter = CalculatorResultFormatterMock()
    private var operationHandler = CalculatorOperationHandlerMock()

    override func setUpWithError() throws {
        try super.setUpWithError()
        calculatorEnvironmentObject = CalculatorEnvironmentObject(calculatorButtons: [],
                                                                  resultFormatter: resultFormatter,
                                                                  calculatorOperationHandler: operationHandler)
    }

    override func tearDownWithError() throws {
        calculatorEnvironmentObject = nil
        try super.tearDownWithError()
    }

    func testHandleCalculatorButton() {
        // Arrange
        let calculatorButton = CalculatorButton(representable: .decimal)
        // Act
        calculatorEnvironmentObject.handleCalculatorButton(calculatorButton)
        // Assert
        XCTAssertEqual(operationHandler.handleCalculatorButtonCallCount, 1)
    }

    func testDeleteLastSingleDigit() {
        // Act
        calculatorEnvironmentObject.deleteLastSingleDigit()
        // Assert
        XCTAssertEqual(operationHandler.deleteLastSingleDigitCallCount, 1)
    }

    func testUpdateValueIsEnteringValueTrue() {
        // Arrange
        let isEnteringValue = true
        resultFormatter.formatEnteredNumberResult = "1"
        // Act
        operationHandler.calculatorDisplay.value = ("1", isEnteringValue)
        // Assert
        XCTAssertEqual(resultFormatter.formatEnteredNumberCallCount, 1)
        XCTAssertEqual(calculatorEnvironmentObject.formattedCalculatorDisplay, "1")
    }

    func testUpdateValueIsEnteringValueFalse() {
        // Arrange
        let isEnteringValue = false
        resultFormatter.formatResultResult = "1"
        // Act
        operationHandler.calculatorDisplay.value = ("1", isEnteringValue)
        // Assert
        XCTAssertEqual(resultFormatter.formatResultCallCount, 1)
        XCTAssertEqual(calculatorEnvironmentObject.formattedCalculatorDisplay, "1")
    }

}
