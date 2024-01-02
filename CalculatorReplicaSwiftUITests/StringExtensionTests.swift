//
//  StringExtensionTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/26/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

final class StringExtensionTests: XCTestCase {

    func testIntegerDigitsCount() {
        // Arrange
        let numberOfIntegerDigits = Int.random(in: 1...9)
        let input = CalculatorInputFactory.createStringIntegerNumber(with: numberOfIntegerDigits)
        // Act
        let integerDigitsCount = input.integerDigitsCount()
        let hasDecimal = input.hasDecimal()
        // Assert
        verifyDigitsCount(result: (integerDigitsCount, hasDecimal),
                          expectedCount: numberOfIntegerDigits,
                          expectedHasDecimal: false)
    }

    func testFractionDigitsCount() {
        // Arrange
        let numberOfFractionDigits = Int.random(in: 1...9)
        let input = CalculatorInputFactory.createFractionDigitNumber(with: numberOfFractionDigits)
        // Act
        let fractionDigitsCount = input.fractionDigitsCount()
        let hasDecimal = input.hasDecimal()
        // Assert
        verifyDigitsCount(result: (fractionDigitsCount, hasDecimal),
                          expectedCount: numberOfFractionDigits,
                          expectedHasDecimal: true)
    }
    
    func testHasExponentTrue() {
        // Arrange
        let randomNumber = CalculatorInputFactory.createStringIntegerNumber(with: 1...9)
        let input = CalculatorInputFactory.creatNumberWithExponent(with: randomNumber, and: 1...9)
        // Act
        let hasExponent = input.hasExponent()
        // Assert
        XCTAssertTrue(hasExponent)
    }
    
    func testHasExponentFalse() {
        // Arrange
        let input = CalculatorInputFactory.createStringIntegerNumber(with: 1...9)
        // Act
        let hasExponent = input.hasExponent()
        // Assert
        XCTAssertFalse(hasExponent)
    }
    
    func testExtractLastCharactersOfZero() {
        // Arrange
        let numberOfFractionDigits = Int.random(in: 1...9)
        var input = CalculatorInputFactory.createFractionDigitNumber(with: numberOfFractionDigits)
        
        let numberOfTrailingZeros = Int.random(in: 1...9)
        for _ in 0..<numberOfTrailingZeros { input.append("0") }
        // Act
        let zeroCharacters = input.extractLastCharactersOf("0")
        // Assert
        XCTAssertEqual(numberOfTrailingZeros, zeroCharacters.count)
    }
    
    func testExtractLastCharactersOfDecimalSeparatorAndZero() {
        // Arrange
        let numberOfFractionDigits = Int.random(in: 1...9)
        var input = CalculatorInputFactory.createStringIntegerNumber(with: numberOfFractionDigits) + "."
        
        let numberOfTrailingZeros = Int.random(in: 1...9)
        for _ in 0..<numberOfTrailingZeros { input.append("0") }
        // Act
        let zeroCharacters = input.extractLastCharactersOf([".", "0"], withCutCharacter: ".")
        // Assert
        XCTAssertEqual(numberOfTrailingZeros + 1, zeroCharacters.count)
    }
    
    // MARK: - Verification Methods
    
    func verifyDigitsCount(result: (count: Int, hasDecimal: Bool),
                           expectedCount: Int,
                           expectedHasDecimal: Bool,
                           file: StaticString = #file,
                           line: UInt = #line) {
        XCTAssertEqual(result.count, expectedCount, file: file, line: line)
        XCTAssertEqual(result.hasDecimal, expectedHasDecimal, file: file, line: line)
    }
    
}
