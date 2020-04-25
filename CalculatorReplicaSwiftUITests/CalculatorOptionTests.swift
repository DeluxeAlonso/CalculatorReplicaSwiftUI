//
//  CalculatorOptionTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/24/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorOptionTests: XCTestCase {

    func testIsPlainNumberTrue() {
        //Arrange
        let calculatorOption = CalculatorOption(representable: .eight)
        //Act
        let isPlainNumber = calculatorOption.isPlainNumber
        //Assert
        XCTAssertTrue(isPlainNumber)
    }
    
    func testIsPlainNumberFalse() {
        //Arrange
        let calculatorOption = CalculatorOption(representable: .equal)
        //Act
        let isPlainNumber = calculatorOption.isPlainNumber
        //Assert
        XCTAssertFalse(isPlainNumber)
    }
    
    func testShouldShowOnResultDisplayNumber() {
        //Arrange
        let calculatorOption = CalculatorOption(representable: .one)
        //Act
        let shouldShowOnResultDisplay = calculatorOption.shouldShowOnResultDisplay
        //Assert
        XCTAssertTrue(shouldShowOnResultDisplay)
    }
    
    func testShouldShowOnResultDisplayDecimal() {
        //Arrange
        let calculatorOption = CalculatorOption(representable: .decimal)
        //Act
        let shouldShowOnResultDisplay = calculatorOption.shouldShowOnResultDisplay
        //Assert
        XCTAssertTrue(shouldShowOnResultDisplay)
    }
    
    func testShouldShowOnResultDisplayOperation() {
        //Arrange
        let calculatorOption = CalculatorOption(representable: .sum)
        //Act
        let shouldShowOnResultDisplay = calculatorOption.shouldShowOnResultDisplay
        //Assert
        XCTAssertFalse(shouldShowOnResultDisplay)
    }

}
