//
//  CalculatorIntegrationTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/24/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

final class CalculatorIntegrationTests: XCTestCase {
    
    private var operationHandler: CalculatorOperationHandlerProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let calculatorConfiguration = CalculatorConfiguration()
        let calculatorValidator = CalculatorOperationValidator(calculatorConfiguration: calculatorConfiguration)
        let calculatorTrimmer = CalculatorDisplayTrimmer()
        operationHandler = CalculatorOperationHadler(calculatorValidator: calculatorValidator,
                                                     calculatorTrimmer: calculatorTrimmer)
    }

    override func tearDownWithError() throws {
        operationHandler = nil
        try super.tearDownWithError()
    }

    func testNumberEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .three),
            CalculatorButton(representable: .five)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("35", operationHandler.calculatorDisplay.value.0)
    }
    
    func testNumberWithDecimalEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .three),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .two)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("35.2", operationHandler.calculatorDisplay.value.0)
    }
    
    func testNumberWithDecimalWithZeroAtLastEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .three),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .zero)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("35.0", operationHandler.calculatorDisplay.value.0)
    }
    
    func testNumberWithDecimalWithMultipleZeroAtLastEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .three),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .zero)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("35.000", operationHandler.calculatorDisplay.value.0)
    }
    
    func testNumberWithDecimalWithMultipleLeadingZeroEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .three),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .zero)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("35.0", operationHandler.calculatorDisplay.value.0)
    }
    
    func testNumberWithDecimalWithDecimalAtFirstEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .three),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .zero)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("0.00350", operationHandler.calculatorDisplay.value.0)
    }
    
    func testZeroNumberWithDecimalWithOnlyDecimalEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .decimal)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("0.", operationHandler.calculatorDisplay.value.0)
    }
    
    func testNumberWithDecimalWithOnlyDecimalEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .decimal)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("10.", operationHandler.calculatorDisplay.value.0)
    }
    
    func testNumberWithDecimalWithOffLimitEntered() {
        // Arrange
        let calculatorButton = CalculatorButton(representable: .nine)
        // Act
        for _ in 0...15 {
            operationHandler.handleCalculatorButton(calculatorButton)
        }
        // Assert
        XCTAssertEqual("999999999", operationHandler.calculatorDisplay.value.0)
    }
    
    func testNumberWithMultipleleadinZeroEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .zero)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("0.00", operationHandler.calculatorDisplay.value.0)
    }
    
    func testSimpleBinaryOperation() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .sum),
            CalculatorButton(representable: .two),
            CalculatorButton(representable: .equal)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("3", operationHandler.calculatorDisplay.value.0)
    }
    
    func testRecurrentBinaryOperation() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .sum),
            CalculatorButton(representable: .two),
            CalculatorButton(representable: .equal),
            CalculatorButton(representable: .equal),
            CalculatorButton(representable: .equal)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("7", operationHandler.calculatorDisplay.value.0)
    }
    
    func testFractionalBinaryOperation() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .sum),
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .equal)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("2.05", operationHandler.calculatorDisplay.value.0)
    }
    
    func testFractionalRecurrentBinaryOperation() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .sum),
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .equal),
            CalculatorButton(representable: .equal),
            CalculatorButton(representable: .equal)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("3.5", operationHandler.calculatorDisplay.value.0)
    }
    
    func testSimpleUnaryOperation() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .negative)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("-1", operationHandler.calculatorDisplay.value.0)
    }
    
    func testRecurrentUnaryOperation() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .negative),
            CalculatorButton(representable: .negative)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("1", operationHandler.calculatorDisplay.value.0)
    }
    
    func testFractionalUnaryOperation() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .negative)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("-1.05", operationHandler.calculatorDisplay.value.0)
    }
    
    func testFractionalRecurrentUnaryOperation() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .one),
            CalculatorButton(representable: .decimal),
            CalculatorButton(representable: .zero),
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .negative),
            CalculatorButton(representable: .negative)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("1.05", operationHandler.calculatorDisplay.value.0)
    }

    func testStackedOnePriorityOperations() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .five),
            CalculatorButton(representable: .sum),
            CalculatorButton(representable: .six),
            CalculatorButton(representable: .subtraction)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("11", operationHandler.calculatorDisplay.value.0)
    }

}
