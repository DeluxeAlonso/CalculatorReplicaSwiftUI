//
//  CalculatorOperationValidatorTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/23/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorOperationValidatorTests: XCTestCase {
    
    private var validatorToTest: CalculatorOperationValidatorProtocol!

    override func setUp() {
        super.setUp()
        validatorToTest = CalculatorOperationValidatorMock(isEnteringNumbers: false,
                                                           calculatorDisplay: "",
                                                           calculatorDisplayMaxLimit: 9)
    }

    override func tearDown() {
        validatorToTest = nil
        super.tearDown()
    }
    
    func testShouldProcessCalculatorOptionNumber() {
        //Arrange
        validatorToTest.calculatorDisplay = ""
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionNewNumber() {
        //Arrange
        validatorToTest.calculatorDisplay = "123"
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionRepeatedNumber() {
        //Arrange
        validatorToTest.calculatorDisplay = "550"
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionNewNumberAfterDecimal() {
        //Arrange
        validatorToTest.calculatorDisplay = "123.4"
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionRepeatedNumberAfterDecimal() {
        //Arrange
        validatorToTest.calculatorDisplay = "555.4"
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionNewNumberInmediatelyAfterDecimal() {
        //Arrange
        validatorToTest.calculatorDisplay = "123."
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionRepeatedNumberInmediatelyAfterDecimal() {
        //Arrange
        validatorToTest.calculatorDisplay = "555."
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionDecimal() {
        //Arrange
        validatorToTest.calculatorDisplay = ""
        let calculatorOption = CalculatorOption(representable: .decimal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionNewDecimal() {
        //Arrange
        validatorToTest.calculatorDisplay = "23"
        let calculatorOption = CalculatorOption(representable: .decimal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionInmediatelyRepeatedDecimal() {
        //Arrange
        validatorToTest.calculatorDisplay = "23."
        let calculatorOption = CalculatorOption(representable: .decimal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertFalse(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionRepeatedDecimal() {
        //Arrange
        validatorToTest.calculatorDisplay = "23.56"
        let calculatorOption = CalculatorOption(representable: .decimal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertFalse(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionOperation() {
        //Arrange
        validatorToTest.calculatorDisplay = "10"
        let calculatorOption = CalculatorOption(representable: .equal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption)
        //Assert
        XCTAssertFalse(shouldProcess)
    }
    
    func testAreDisplayCharactersInRangeWhileNotEnteringNumbers() {
        //Arrange
        validatorToTest.isEnteringNumbers = false
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange()
        //Assert
        XCTAssertTrue(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeCalculatorDisplayInMinRange() {
        //Arrange
        validatorToTest.isEnteringNumbers = true
        validatorToTest.calculatorDisplay = ""
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange()
        //Assert
        XCTAssertTrue(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeCalculatorDisplayInMidRange() {
        //Arrange
        validatorToTest.isEnteringNumbers = true
        validatorToTest.calculatorDisplay = "23345.4"
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange()
        //Assert
        XCTAssertTrue(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeCalculatorDisplayInMaxRange() {
        //Arrange
        validatorToTest.isEnteringNumbers = true
        validatorToTest.calculatorDisplay = "23345.4342"
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange()
        //Assert
        XCTAssertFalse(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeOffLimit() {
        //Arrange
        validatorToTest.isEnteringNumbers = true
        validatorToTest.calculatorDisplay = "23345.43422"
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange()
        //Assert
        XCTAssertFalse(areDisplayCharactersInRange)
    }

    func testIsEnteringSignificantNumberSingleZero() {
        //Arrange
        validatorToTest.calculatorDisplay = "0"
        let calculatorOption = CalculatorOption(representable: .zero)
        //Act
        let isEnteringSignificantNumber = validatorToTest.isEnteringSignificantNumber(calculatorOption)
        //Assert
        XCTAssertFalse(isEnteringSignificantNumber)
    }
    
    func testIsEnteringSignificantNumberMultipleZeros() {
        //Arrange
        validatorToTest.calculatorDisplay = "0000"
        let calculatorOption = CalculatorOption(representable: .zero)
        //Act
        let isEnteringSignificantNumber = validatorToTest.isEnteringSignificantNumber(calculatorOption)
        //Assert
        XCTAssertFalse(isEnteringSignificantNumber)
    }

}
