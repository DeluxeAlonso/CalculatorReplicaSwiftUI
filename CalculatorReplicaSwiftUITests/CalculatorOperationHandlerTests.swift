//
//  CalculatorOperationHandlerTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/24/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorOperationHandlerTests: XCTestCase {
    
    private var operationHandlerToTest: CalculatorOperationHandlerProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        operationHandlerToTest = CalculatorTestsMockFactory.createCalculatorOperationHandler()
    }

    override func tearDownWithError() throws {
        operationHandlerToTest = nil
        try super.tearDownWithError()
    }

    func testIsEnteringNumberTrue() {
        //Arrange
        let calculatorOption = CalculatorOption(representable: .three)
        //Act
        operationHandlerToTest.handleCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(operationHandlerToTest.isEnteringNumbers)
    }
    
    func testIsEnteringNumberFalse() {
        //Arrange
        let calculatorOption = CalculatorOption(representable: .division)
        //Act
        operationHandlerToTest.handleCalculatorOption(calculatorOption)
        //Assert
        XCTAssertFalse(operationHandlerToTest.isEnteringNumbers)
    }
    
    func testNumberEntered() {
        //Arrange
        let options = [
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("35", operationHandlerToTest.calculatorDisplay)
    }
    
    func testNumberWithDecimalEntered() {
        //Arrange
        let options = [
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .two)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("35.2", operationHandlerToTest.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithZeroAtLastEntered() {
        //Arrange
        let options = [
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("35.0", operationHandlerToTest.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithMultipleZeroAtLastEntered() {
        //Arrange
        let options = [
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("35.000", operationHandlerToTest.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithMultipleLeadingZeroEntered() {
        //Arrange
        let options = [
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("35.0", operationHandlerToTest.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithDecimalAtFirstEntered() {
        //Arrange
        let options = [
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .three),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .zero)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("0.00350", operationHandlerToTest.calculatorDisplay)
    }
    
    func testZeroNumberWithDecimalWithOnlyDecimalEntered() {
        //Arrange
        let options = [
            CalculatorOption(representable: .decimal)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("0.", operationHandlerToTest.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithOnlyDecimalEntered() {
        //Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .decimal)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("10.", operationHandlerToTest.calculatorDisplay)
    }
    
    func testNumberWithDecimalWithOffLimitEntered() {
        //Arrange
        let calculatorOption = CalculatorOption(representable: .nine)
        //Act
        for _ in 0...15 {
            operationHandlerToTest.handleCalculatorOption(calculatorOption)
        }
        //Assert
        XCTAssertEqual("999999999", operationHandlerToTest.calculatorDisplay)
    }
    
    func testNumberWithMultipleleadinZeroEntered() {
        //Arrange
        let options = [
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .zero)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("0.00", operationHandlerToTest.calculatorDisplay)
    }
    
    func testSimpleBinaryOperation() {
        //Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .sum),
            CalculatorOption(representable: .two),
            CalculatorOption(representable: .equal)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("3", operationHandlerToTest.calculatorDisplay)
    }
    
    func testRecurrentBinaryOperation() {
        //Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .sum),
            CalculatorOption(representable: .two),
            CalculatorOption(representable: .equal),
            CalculatorOption(representable: .equal),
            CalculatorOption(representable: .equal)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("7", operationHandlerToTest.calculatorDisplay)
    }
    
    func testFractionalBinaryOperation() {
        //Arrange
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
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("2.05", operationHandlerToTest.calculatorDisplay)
    }
    
    func testFractionalRecurrentBinaryOperation() {
        //Arrange
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
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("3.5", operationHandlerToTest.calculatorDisplay)
    }
    
    func testSimpleUnaryOperation() {
        //Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .negative)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("-1", operationHandlerToTest.calculatorDisplay)
    }
    
    func testRecurrentUnaryOperation() {
        //Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .negative),
            CalculatorOption(representable: .negative)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("1", operationHandlerToTest.calculatorDisplay)
    }
    
    func testFractionalUnaryOperation() {
        //Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .negative)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("-1.05", operationHandlerToTest.calculatorDisplay)
    }
    
    func testFractionalRecurrentUnaryOperation() {
        //Arrange
        let options = [
            CalculatorOption(representable: .one),
            CalculatorOption(representable: .decimal),
            CalculatorOption(representable: .zero),
            CalculatorOption(representable: .five),
            CalculatorOption(representable: .negative),
            CalculatorOption(representable: .negative)
        ]
        //Act
        options.forEach { operationHandlerToTest.handleCalculatorOption($0) }
        //Assert
        XCTAssertEqual("1.05", operationHandlerToTest.calculatorDisplay)
    }

}
