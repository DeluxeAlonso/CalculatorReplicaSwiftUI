//
//  CalculatorImageButtonTests.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 12/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import SnapshotTesting
@testable import Calculator
import XCTest

final class CalculatorImageButtonTests: XCTestCase {

    func testCalculatorImageButton() {
        let calculatorButton = CalculatorButtonProtocolMock()
        calculatorButton.icon = "plus"
        calculatorButton.gridSpace = 1

        let view = CalculatorImageButton(button: calculatorButton)
        assertSnapshot(of: view, as: .image)
    }

    func testCalculatorImageButtonExpandedGridSpace() {
        let calculatorButton = CalculatorButtonProtocolMock()
        calculatorButton.icon = "plus"
        calculatorButton.gridSpace = 2

        let view = CalculatorImageButton(button: calculatorButton)
        assertSnapshot(of: view, as: .image)
    }

}
