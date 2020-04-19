//
//  CalculatorResultFormatterTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/18/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import CalculatorReplicaSwiftUI

class CalculatorResultFormatterTests: XCTestCase {
    
    private var formatterToTest: CalculatorResultFormatterProtocol!

    override func setUp() {
        super.setUp()
        formatterToTest = CalculatorResultFormatter()
    }

    override func tearDown() {
        formatterToTest = nil
        super.tearDown()
    }
    
    // MARK: - Integer
    
    func testIntegerNumberZero() {
        //Arrange
        let calculatorDisplay = "0"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "0")
    }
    
    func testIntegerNumberSmall() {
        //Arrange
        let calculatorDisplay = "15"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "15")
    }
    
    func testIntegerNumberMedium() {
        //Arrange
        let calculatorDisplay = "123456"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "123,456")
    }
    
    func testIntegerNumberLarge() {
        //Arrange
        let calculatorDisplay = "999999999"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "999,999,999")
    }
    
    func testIntegerNumberOffLimit() {
        //Arrange
        let calculatorDisplay = "1000000000"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "1E9")
    }
    
    func testIntegerNumberOffLimitNegative() {
        //Arrange
        let calculatorDisplay = "-1000000000"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "-1E9")
    }
    
    // MARK: - Decimals
    
    func testDecimalNumberZero() {
        //Arrange
        let calculatorDisplay = "0.0"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "0")
    }
    
    func testDecimalNumberSmall() {
        //Arrange
        let calculatorDisplay = "10.05"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "10.05")
    }
    
    func testDecimalNumberSmallNonSignificantZeroAtFirst() {
        //Arrange
        let calculatorDisplay = "010.05"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "10.05")
    }
    
    func testDecimalNumberSmallNonSignificantZeroAtLast() {
        //Arrange
        let calculatorDisplay = "10.05000"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "10.05")
    }
    
    func testDecimalNumberSmallNonSignificantZero() {
        //Arrange
        let calculatorDisplay = "00010.05000"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "10.05")
    }
    
    func testDecimalNumberMedium() {
        //Arrange
        let calculatorDisplay = "1234.10203"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "1,234.10203")
    }
    
    func testDecimalNumberMediumNonSignificantZeroAtFirst() {
        //Arrange
        let calculatorDisplay = "01234.10203"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "1,234.10203")
    }
    
    func testDecimalNumberMediumNonSignificantZeroAtLast() {
        //Arrange
        let calculatorDisplay = "1234.1020300"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "1,234.10203")
    }
    
    func testDecimalNumberMediumNonSignificantZero() {
        //Arrange
        let calculatorDisplay = "001234.1020300"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "1,234.10203")
    }
    
    func testDecimalNumberLarge() {
        //Arrange
        let calculatorDisplay = "123456.234"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "123,456.234")
    }
    
    func testDecimalNumberLargeNonSignificantZeroAtFirst() {
        //Arrange
        let calculatorDisplay = "0123456.234"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "123,456.234")
    }
    
    func testDecimalNumberLargeNonSignificantZeroAtLast() {
        //Arrange
        let calculatorDisplay = "123456.2340"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "123,456.234")
    }
    
    func testDecimalNumberLargeNonSignificantZero() {
        //Arrange
        let calculatorDisplay = "0123456.2340"
        //Act
        let formmattedNumber = formatterToTest.formatResult(from: calculatorDisplay)
        //Assert
        XCTAssertEqual(formmattedNumber, "123,456.234")
    }

}