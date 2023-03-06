//
//  CalculatorIntegrationTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/24/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorIntegrationTests: XCTestCase {
    
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
        XCTAssertEqual("35", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("35.2", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("35.0", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("35.000", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("35.0", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("0.00350", operationHandler.calculatorDisplay)
    }
    
    func testZeroNumberWithDecimalWithOnlyDecimalEntered() {
        // Arrange
        let buttons = [
            CalculatorButton(representable: .decimal)
        ]
        // Act
        buttons.forEach { operationHandler.handleCalculatorButton($0) }
        // Assert
        XCTAssertEqual("0.", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("10.", operationHandler.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithOffLimitEntered() {
        // Arrange
        let calculatorButton = CalculatorButton(representable: .nine)
        // Act
        for _ in 0...15 {
            operationHandler.handleCalculatorButton(calculatorButton)
        }
        // Assert
        XCTAssertEqual("999999999", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("0.00", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("3", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("7", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("2.05", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("3.5", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("-1", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("1", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("-1.05", operationHandler.calculatorDisplay)
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
        XCTAssertEqual("1.05", operationHandler.calculatorDisplay)
    }

}
