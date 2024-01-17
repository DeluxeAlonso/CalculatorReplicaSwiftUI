//
//  PendingBinaryOperationTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/24/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

final class PendingBinaryOperationTests: XCTestCase {

    func testSimpleOperation() {
        // Arrange
        let pendingBinaryOperation = PendingBinaryOperation(function: { $0 + $1 }, firstOperand: 10.0, priority: 1)
        // Act
        pendingBinaryOperation.setOperand(15.0)
        let resultValue = pendingBinaryOperation.perform()
        // Assert
        XCTAssertEqual(25.0, resultValue)
    }
    
    func testRecurrentOperation() {
        // Arrange
        let pendingBinaryOperation = PendingBinaryOperation(function: { $0 + $1 }, firstOperand: 10.0, priority: 1)
        // Act
        pendingBinaryOperation.setOperand(15.0)
        _ = pendingBinaryOperation.perform()
        _ = pendingBinaryOperation.perform()
        let resultValue = pendingBinaryOperation.perform()
        // Assert
        XCTAssertEqual(55.0, resultValue)
    }
    
    func testNilOperand() {
        // Arrange
        let pendingBinaryOperation = PendingBinaryOperation(function: { $0 + $1 }, firstOperand: 10.0, priority: 1)
        // Act
        let resultValue = pendingBinaryOperation.perform()
        // Assert
        XCTAssertEqual(0, resultValue)
    }
    
    func testHasOperandTrue() {
        // Arrange
        let pendingBinaryOperation = PendingBinaryOperation(function: { $0 + $1 }, firstOperand: 10.0, priority: 1)
        // Act
        pendingBinaryOperation.setOperand(15.0)
        let hasOperand = pendingBinaryOperation.hasOperand
        // Assert
        XCTAssertTrue(hasOperand)
    }
    
    func testHasOperandFalse() {
        // Arrange
        let pendingBinaryOperation = PendingBinaryOperation(function: { $0 + $1 }, firstOperand: 10.0, priority: 1)
        // Act
        let hasOperand = pendingBinaryOperation.hasOperand
        // Assert
        XCTAssertFalse(hasOperand)
    }
    
}
