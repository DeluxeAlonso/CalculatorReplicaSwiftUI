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
        validatorToTest = CalculatorOperationValidatorMock(calculatorDisplayMaxLimit: 9)
    }

    override func tearDown() {
        validatorToTest = nil
        super.tearDown()
    }
    
    func testShouldProcessCalculatorOptionNumber() {
        //Arrange
        let calculatorDisplay = ""
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionNewNumber() {
        //Arrange
        let calculatorDisplay = "123"
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionRepeatedNumber() {
        //Arrange
        let calculatorDisplay = "550"
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionNewNumberAfterDecimal() {
        //Arrange
        let calculatorDisplay = "123.4"
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionRepeatedNumberAfterDecimal() {
        //Arrange
        let calculatorDisplay = "555.4"
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionNewNumberInmediatelyAfterDecimal() {
        //Arrange
        let calculatorDisplay = "123."
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionRepeatedNumberInmediatelyAfterDecimal() {
        //Arrange
        let calculatorDisplay = "555."
        let calculatorOption = CalculatorOption(representable: .five)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionDecimal() {
        //Arrange
        let calculatorDisplay = ""
        let calculatorOption = CalculatorOption(representable: .decimal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionNewDecimal() {
        //Arrange
        let calculatorDisplay = "23"
        let calculatorOption = CalculatorOption(representable: .decimal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertTrue(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionInmediatelyRepeatedDecimal() {
        //Arrange
        let calculatorDisplay = "23."
        let calculatorOption = CalculatorOption(representable: .decimal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertFalse(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionRepeatedDecimal() {
        //Arrange
        let calculatorDisplay = "23.56"
        let calculatorOption = CalculatorOption(representable: .decimal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertFalse(shouldProcess)
    }
    
    func testShouldProcessCalculatorOptionOperation() {
        //Arrange
        let calculatorDisplay = "10"
        let calculatorOption = CalculatorOption(representable: .equal)
        //Act
        let shouldProcess = validatorToTest.shouldProcessCalculatorOption(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertFalse(shouldProcess)
    }
    
    func testAreDisplayCharactersInRangeWhileNotEnteringNumbers() {
        //Arrange
        let isEnteringNumbers = false
        let calculatorDisplay = ""
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        //Assert
        XCTAssertTrue(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeCalculatorDisplayInMinRange() {
        //Arrange
        let isEnteringNumbers = true
        let calculatorDisplay = ""
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        //Assert
        XCTAssertTrue(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeCalculatorDisplayInMidRange() {
        //Arrange
        let isEnteringNumbers = true
        let calculatorDisplay = "23345.4"
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        //Assert
        XCTAssertTrue(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeCalculatorDisplayInMaxRange() {
        //Arrange
        let isEnteringNumbers = true
        let calculatorDisplay = "23345.4342"
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        //Assert
        XCTAssertFalse(areDisplayCharactersInRange)
    }
    
    func testAreDisplayCharactersInRangeOffLimit() {
        //Arrange
        let isEnteringNumbers = true
        let calculatorDisplay = "23345.43422"
        //Act
        let areDisplayCharactersInRange = validatorToTest.areDisplayCharactersInRange(for: calculatorDisplay,
                                                                                      and: isEnteringNumbers)
        //Assert
        XCTAssertFalse(areDisplayCharactersInRange)
    }

    func testIsEnteringSignificantNumberSingleZero() {
        //Arrange
        let calculatorDisplay = "0"
        let calculatorOption = CalculatorOption(representable: .zero)
        //Act
        let isEnteringSignificantNumber = validatorToTest.isEnteringSignificantNumber(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertFalse(isEnteringSignificantNumber)
    }
    
    func testIsEnteringSignificantNumberMultipleZeros() {
        //Arrange
        let calculatorDisplay = "0000"
        let calculatorOption = CalculatorOption(representable: .zero)
        //Act
        let isEnteringSignificantNumber = validatorToTest.isEnteringSignificantNumber(calculatorOption, in: calculatorDisplay)
        //Assert
        XCTAssertFalse(isEnteringSignificantNumber)
    }

}
