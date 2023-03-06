//
//  CalculatorButtonTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/24/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorButtonTests: XCTestCase {

    func testIsPlainNumberTrue() {
        // Arrange
        let calculatorButton = CalculatorButton(representable: .eight)
        // Act
        let isPlainNumber = calculatorButton.isPlainNumber
        // Assert
        XCTAssertTrue(isPlainNumber)
    }
    
    func testIsPlainNumberFalse() {
        // Arrange
        let calculatorButton = CalculatorButton(representable: .equal)
        // Act
        let isPlainNumber = calculatorButton.isPlainNumber
        // Assert
        XCTAssertFalse(isPlainNumber)
    }
    
    func testShouldShowOnResultDisplayNumber() {
        // Arrange
        let calculatorButton = CalculatorButton(representable: .one)
        // Act
        let shouldShowOnResultDisplay = calculatorButton.shouldShowOnResultDisplay
        // Assert
        XCTAssertTrue(shouldShowOnResultDisplay)
    }
    
    func testShouldShowOnResultDisplayDecimal() {
        // Arrange
        let calculatorButton = CalculatorButton(representable: .decimal)
        // Act
        let shouldShowOnResultDisplay = calculatorButton.shouldShowOnResultDisplay
        // Assert
        XCTAssertTrue(shouldShowOnResultDisplay)
    }
    
    func testShouldShowOnResultDisplayOperation() {
        // Arrange
        let calculatorButton = CalculatorButton(representable: .sum)
        // Act
        let shouldShowOnResultDisplay = calculatorButton.shouldShowOnResultDisplay
        // Assert
        XCTAssertFalse(shouldShowOnResultDisplay)
    }

}
