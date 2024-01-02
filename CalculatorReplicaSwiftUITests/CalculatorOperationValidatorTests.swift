//
//  CalculatorOperationValidatorTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/23/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

final class CalculatorOperationValidatorTests: XCTestCase {
    
    private var validatorToTest: CalculatorOperationValidatorProtocol!
    private var mockCalculatorConfiguration: CalculatorConfigurationMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockCalculatorConfiguration = CalculatorConfigurationMock()
        validatorToTest = CalculatorOperationValidator(calculatorConfiguration: mockCalculatorConfiguration)
    }

    override func tearDownWithError() throws {
        mockCalculatorConfiguration = nil
        validatorToTest = nil
        try super.tearDownWithError()
    }
    
    func testShouldProcessCalculatorButtonNumber() {
        // Arrange
        let calculatorDisplay = ""
        let calculatorButton = CalculatorButton(representable: .five)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonNewNumber() {
        // Arrange
        let calculatorDisplay = "123"
        let calculatorButton = CalculatorButton(representable: .five)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonRepeatedNumber() {
        // Arrange
        let calculatorDisplay = "550"
        let calculatorButton = CalculatorButton(representable: .five)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonNewNumberAfterDecimal() {
        // Arrange
        let calculatorDisplay = "123.4"
        let calculatorButton = CalculatorButton(representable: .five)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonRepeatedNumberAfterDecimal() {
        // Arrange
        let calculatorDisplay = "555.4"
        let calculatorButton = CalculatorButton(representable: .five)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonNewNumberInmediatelyAfterDecimal() {
        // Arrange
        let calculatorDisplay = "123."
        let calculatorButton = CalculatorButton(representable: .five)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonRepeatedNumberInmediatelyAfterDecimal() {
        // Arrange
        let calculatorDisplay = "555."
        let calculatorButton = CalculatorButton(representable: .five)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonDecimal() {
        // Arrange
        let calculatorDisplay = ""
        let calculatorButton = CalculatorButton(representable: .decimal)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonNewDecimal() {
        // Arrange
        let calculatorDisplay = "23"
        let calculatorButton = CalculatorButton(representable: .decimal)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonInmediatelyRepeatedDecimal() {
        // Arrange
        let calculatorDisplay = "23."
        let calculatorButton = CalculatorButton(representable: .decimal)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertFalse(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonRepeatedDecimal() {
        // Arrange
        let calculatorDisplay = "23.56"
        let calculatorButton = CalculatorButton(representable: .decimal)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertFalse(shouldProcess)
    }
    
    func testShouldProcessCalculatorButtonOperation() {
        // Arrange
        let calculatorDisplay = "10"
        let calculatorButton = CalculatorButton(representable: .equal)
        // Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorButton(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertFalse(shouldProcess)
    }
    
    func testAreDisplayCharactersInRangeWhileNotEnteringNumbers() {
        // Arrange
        let isEnteringNumbers = false
        let calculatorDisplay = ""
        // Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        // Assert
        XCTAssertTrue(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeCalculatorDisplayInMinRange() {
        // Arrange
        let isEnteringNumbers = true
        let calculatorDisplay = ""
        // Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        // Assert
        XCTAssertTrue(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeCalculatorDisplayInMidRange() {
        // Arrange
        let isEnteringNumbers = true
        let calculatorDisplay = "23345.4"
        // Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        // Assert
        XCTAssertTrue(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeCalculatorDisplayInMaxRange() {
        // Arrange
        let isEnteringNumbers = true
        let calculatorDisplay = "23345.4342"
        // Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        // Assert
        XCTAssertFalse(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeOffLimit() {
        // Arrange
        let isEnteringNumbers = true
        let calculatorDisplay = "23345.43422"
        // Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        // Assert
        XCTAssertFalse(areDisplayCharactersInRange)
    }

    func testIsEnteringSignificantNumberSingleZero() {
        // Arrange
        let calculatorDisplay = "0"
        let calculatorButton = CalculatorButton(representable: .zero)
        // Act
        let isEnteringSignificantNumber = validatorToTest.isEnteringSignificantNumber(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertFalse(isEnteringSignificantNumber)
    }
    
    func testIsEnteringSignificantNumberMultipleZeros() {
        // Arrange
        let calculatorDisplay = "0000"
        let calculatorButton = CalculatorButton(representable: .zero)
        // Act
        let isEnteringSignificantNumber = validatorToTest.isEnteringSignificantNumber(calculatorButton, in: calculatorDisplay)
        // Assert
        XCTAssertFalse(isEnteringSignificantNumber)
    }

}
