//
//  CalculatorConstantsTests.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 16/02/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

@testable import Calculator
import XCTest

final class CalculatorConstantsTests: XCTestCase {

    func testNonSignificantCharacters() throws {
        // Act
        let nonSignificantCharacters = CalculatorConstants.nonSignificantCharacters
        // Assert
        XCTAssertEqual(nonSignificantCharacters.count, 2)
    }

}
