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
        calculatorEnvironmentObject.formattedCalculatorDisplay = "0"
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

    func testHandleCalculatorButtonWithIdentifier() {
        // Arrange
        calculatorEnvironmentObject = CalculatorEnvironmentObject(calculatorButtons: [[CalculatorButton(representable: .decimal)]],
                                                                  resultFormatter: resultFormatter,
                                                                  calculatorOperationHandler: operationHandler)
        let calculatorButton = CalculatorButton(representable: .decimal)
        // Act
        calculatorEnvironmentObject.handleCalculatorButton(identifier: calculatorButton.identifier)
        // Assert
        XCTAssertEqual(operationHandler.handleCalculatorButtonCallCount, 1)
    }

    func testHandleCalculatorButtonWithInvalidIdentifier() {
        // Arrange
        calculatorEnvironmentObject = CalculatorEnvironmentObject(calculatorButtons: [[CalculatorButton(representable: .decimal)]],
                                                                  resultFormatter: resultFormatter,
                                                                  calculatorOperationHandler: operationHandler)
        let calculatorButton = CalculatorButton(representable: .division)
        // Act
        calculatorEnvironmentObject.handleCalculatorButton(identifier: calculatorButton.identifier)
        // Assert
        XCTAssertEqual(operationHandler.handleCalculatorButtonCallCount, 0)
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
        resultFormatter.formatEnteredNumberResult = "11"
        let expectation = expectation(description: "Entered number should be formatted")
        // Act
        resultFormatter.formatEnteredNumberCall = { display in
            XCTAssertEqual(display, "2")
            expectation.fulfill()
        }
        operationHandler.calculatorDisplay.value = ("2", isEnteringValue)
        // Assert
        waitForExpectations(timeout: 1.0)
        XCTAssertEqual(resultFormatter.formatEnteredNumberCallCount, 1)
        XCTAssertEqual(calculatorEnvironmentObject.formattedCalculatorDisplay, "11")
    }

    func testUpdateValueIsEnteringValueTrueNilFormatEnteredNumber() {
        // Arrange
        let isEnteringValue = true
        resultFormatter.formatEnteredNumberResult = nil
        let expectation = expectation(description: "Entered number should be formatted")
        // Act
        resultFormatter.formatEnteredNumberCall = { display in
            XCTAssertEqual(display, "1")
            expectation.fulfill()
        }
        operationHandler.calculatorDisplay.value = ("1", isEnteringValue)
        // Assert
        waitForExpectations(timeout: 1.0)
        XCTAssertEqual(resultFormatter.formatEnteredNumberCallCount, 1)
        XCTAssertEqual(calculatorEnvironmentObject.formattedCalculatorDisplay, "0")
    }

    func testUpdateValueIsEnteringValueFalse() {
        // Arrange
        let isEnteringValue = false
        resultFormatter.formatResultResult = "11"
        let expectation = expectation(description: "Result should be formatted")
        // Act
        resultFormatter.formatResultCall = { display in
            XCTAssertEqual(display, "1")
            expectation.fulfill()
        }
        operationHandler.calculatorDisplay.value = ("1", isEnteringValue)
        // Assert
        waitForExpectations(timeout: 1.0)
        XCTAssertEqual(resultFormatter.formatResultCallCount, 1)
        XCTAssertEqual(calculatorEnvironmentObject.formattedCalculatorDisplay, "11")
    }

    func testUpdateValueIsEnteringValueFalseFormattedResultNil() {
        // Arrange
        let isEnteringValue = false
        resultFormatter.formatResultResult = nil
        let expectation = expectation(description: "Result should be formatted")
        // Act
        resultFormatter.formatResultCall = { display in
            XCTAssertEqual(display, "1")
            expectation.fulfill()
        }
        operationHandler.calculatorDisplay.value = ("1", isEnteringValue)
        // Assert
        waitForExpectations(timeout: 1.0)
        XCTAssertEqual(resultFormatter.formatResultCallCount, 1)
        XCTAssertEqual(calculatorEnvironmentObject.formattedCalculatorDisplay, "0")
    }

}
