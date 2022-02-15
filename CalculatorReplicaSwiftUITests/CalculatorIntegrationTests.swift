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
        let options = [
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("35", operationHandler.calculatorDisplay)
    }
    
    func testNumberWithDecimalEntered() {
        // Arrange
        let options = [
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .two)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("35.2", operationHandler.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithZeroAtLastEntered() {
        // Arrange
        let options = [
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("35.0", operationHandler.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithMultipleZeroAtLastEntered() {
        // Arrange
        let options = [
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("35.000", operationHandler.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithMultipleLeadingZeroEntered() {
        // Arrange
        let options = [
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("35.0", operationHandler.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithDecimalAtFirstEntered() {
        // Arrange
        let options = [
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .zero)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("0.00350", operationHandler.calculatorDisplay)
    }
    
    func testZeroNumberWithDecimalWithOnlyDecimalEntered() {
        // Arrange
        let options = [
            CalculatorOption(representable: .decimal)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("0.", operationHandler.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithOnlyDecimalEntered() {
        // Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .decimal)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("10.", operationHandler.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithOffLimitEntered() {
        // Arrange
        let calculatorOption = CalculatorOption(representable: .nine)
        // Act
        for _ in 0...15 {
            operationHandler.handleCalculatorOption(calculatorOption)
        }
        // Assert
        XCTAssertEqual("999999999", operationHandler.calculatorDisplay)
    }
    
    func testNumberWithMultipleleadinZeroEntered() {
        // Arrange
        let options = [
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("0.00", operationHandler.calculatorDisplay)
    }
    
    func testSimpleBinaryOperation() {
        // Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .sum),
            CalculatorOption(representable: .two),
            CalculatorOption(representable: .equal)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("3", operationHandler.calculatorDisplay)
    }
    
    func testRecurrentBinaryOperation() {
        // Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .sum),
            CalculatorOption(representable: .two),
            CalculatorOption(representable: .equal),
            CalculatorOption(representable: .equal),
            CalculatorOption(representable: .equal)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("7", operationHandler.calculatorDisplay)
    }
    
    func testFractionalBinaryOperation() {
        // Arrange
        let options = [
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .sum),
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .equal)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("2.05", operationHandler.calculatorDisplay)
    }
    
    func testFractionalRecurrentBinaryOperation() {
        // Arrange
        let options = [
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .sum),
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .equal),
            CalculatorOption(representable: .equal),
            CalculatorOption(representable: .equal)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("3.5", operationHandler.calculatorDisplay)
    }
    
    func testSimpleUnaryOperation() {
        // Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .negative)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("-1", operationHandler.calculatorDisplay)
    }
    
    func testRecurrentUnaryOperation() {
        // Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .negative),
            CalculatorOption(representable: .negative)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("1", operationHandler.calculatorDisplay)
    }
    
    func testFractionalUnaryOperation() {
        // Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .negative)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("-1.05", operationHandler.calculatorDisplay)
    }
    
    func testFractionalRecurrentUnaryOperation() {
        // Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .negative),
            CalculatorOption(representable: .negative)
        ]
        // Act
        options.forEach { operationHandler.handleCalculatorOption($0) }
        // Assert
        XCTAssertEqual("1.05", operationHandler.calculatorDisplay)
    }

}
