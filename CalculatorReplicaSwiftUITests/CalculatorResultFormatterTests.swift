//
//  CalculatorResultFormatterTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/18/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

final class CalculatorResultFormatterTests: XCTestCase {
    
    private var formatterToTest: CalculatorResultFormatterProtocol!
    private var mockCalculatorConfiguration: CalculatorConfigurationMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockCalculatorConfiguration = CalculatorConfigurationMock()
        formatterToTest = CalculatorResultFormatter(calculatorConfiguration: mockCalculatorConfiguration)
    }

    override func tearDownWithError() throws {
        mockCalculatorConfiguration = nil
        formatterToTest = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Integer
    
    func testIntegerNumberZero() {
        // Arrange
        let calculatorDisplay = "0"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "0")
    }
    
    func testIntegerNumberSmall() {
        // Arrange
        let calculatorDisplay = "15"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "15")
    }
    
    func testIntegerNumberMedium() {
        // Arrange
        let calculatorDisplay = "123456"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "123,456")
    }
    
    func testIntegerNumberLarge() {
        // Arrange
        let calculatorDisplay = "999999999"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "999,999,999")
    }
    
    func testIntegerNumberOffLimit() {
        // Arrange
        let calculatorDisplay = "1000000000"
        mockCalculatorConfiguration.calculatorDisplayMaxLimitValue = 9
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "1e9")
    }
    
    func testIntegerNumberOffLimitNegative() {
        // Arrange
        let calculatorDisplay = "-1000000000"
        mockCalculatorConfiguration.calculatorDisplayMaxLimitValue = 9
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "-1e9")
    }
    
    // MARK: - Decimals
    
    func testDecimalNumberZero() {
        // Arrange
        let calculatorDisplay = "0.0"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "0")
    }
    
    func testDecimalNumberSmall() {
        // Arrange
        let calculatorDisplay = "10.05"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "10.05")
    }
    
    func testDecimalNumberSmallNonSignificantZeroAtFirst() {
        // Arrange
        let calculatorDisplay = "010.05"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "10.05")
    }
    
    func testDecimalNumberSmallNonSignificantZeroAtLast() {
        // Arrange
        let calculatorDisplay = "10.05000"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "10.05")
    }
    
    func testDecimalNumberSmallNonSignificantZero() {
        // Arrange
        let calculatorDisplay = "00010.05000"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "10.05")
    }
    
    func testDecimalNumberMedium() {
        // Arrange
        let calculatorDisplay = "1234.10203"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "1,234.10203")
    }
    
    func testDecimalNumberMediumNonSignificantZeroAtFirst() {
        // Arrange
        let calculatorDisplay = "01234.10203"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "1,234.10203")
    }
    
    func testDecimalNumberMediumNonSignificantZeroAtLast() {
        // Arrange
        let calculatorDisplay = "1234.1020300"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "1,234.10203")
    }
    
    func testDecimalNumberMediumNonSignificantZero() {
        // Arrange
        let calculatorDisplay = "001234.1020300"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "1,234.10203")
    }
    
    func testDecimalNumberLarge() {
        // Arrange
        let calculatorDisplay = "123456.234"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "123,456.234")
    }
    
    func testDecimalNumberLargeNonSignificantZeroAtFirst() {
        // Arrange
        let calculatorDisplay = "0123456.234"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "123,456.234")
    }
    
    func testDecimalNumberLargeNonSignificantZeroAtLast() {
        // Arrange
        let calculatorDisplay = "123456.2340"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "123,456.234")
    }
    
    func testDecimalNumberLargeNonSignificantZero() {
        // Arrange
        let calculatorDisplay = "0123456.2340"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "123,456.234")
    }
    
    func testDecimalNumberMaximumFractionDigits() {
        // Arrange
        let calculatorDisplay = "9.88888888888889"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "9.88888889")
    }
    
    func testDecimalNumberWithLotOfFractionalDigits() {
        // Arrange
        let calculatorDisplay = "5.1499999999999995"
        // Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "5.15")
    }
    
    func testEnteredNumberWithLeadingZero() {
        // Arrange
        let calculatorDisplay = "0.0000"
        // Act
        let formmattedNumber = formatterToTest.formatEnteredNumber(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "0.0000")
    }
    
    func testEnteredNumberZeroWithDecimalPointAtLast() {
        // Arrange
        let calculatorDisplay = "0."
        // Act
        let formmattedNumber = formatterToTest.formatEnteredNumber(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "0.")
    }
    
    func testEnteredNumberWithDecimalPointAtLast() {
        // Arrange
        let calculatorDisplay = "30."
        // Act
        let formmattedNumber = formatterToTest.formatEnteredNumber(from: calculatorDisplay)
        // Assert
        XCTAssertEqual(formmattedNumber, "30.")
    }

}
