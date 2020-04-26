//
//  StringExtensionTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/26/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

class StringExtensionTests: XCTestCase {

    func testIntegerDigitsCount() {
        //Arrange
        let numberOfDigits = Int.random(in: 1...9)
        let input = CalculatorInputFactory.createStringIntegerNumber(with: numberOfDigits)
        //Act
        let integerDigitsCount = input.integerDigitsCount()
        //Assert
        XCTAssertEqual(integerDigitsCount, numberOfDigits)
    }

}
