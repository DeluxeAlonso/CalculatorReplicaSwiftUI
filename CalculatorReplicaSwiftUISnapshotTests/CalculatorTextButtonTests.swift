//
//  CalculatorTextButtonTests.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 12/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import SnapshotTesting
@testable import Calculator
import XCTest

final class CalculatorTextButtonTests: XCTestCase {

    func testCalculatorTextButton() {
        let calculatorButton = CalculatorButtonProtocolMock()
        calculatorButton.title = "1"
        calculatorButton.gridSpace = 1

        let view = CalculatorTextButton(button: calculatorButton)
        assertSnapshot(of: view, as: .image)
    }

    func testCalculatorTextButtonExpandedGridSpace() {
        let calculatorButton = CalculatorButtonProtocolMock()
        calculatorButton.title = "1"
        calculatorButton.gridSpace = 2

        let view = CalculatorTextButton(button: calculatorButton)
        assertSnapshot(of: view, as: .image)
    }

}
