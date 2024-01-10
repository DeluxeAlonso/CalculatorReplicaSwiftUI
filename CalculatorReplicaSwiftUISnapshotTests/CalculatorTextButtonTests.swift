//
//  CalculatorTextButtonTests.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 10/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

@testable import Calculator
import SnapshotTesting
import XCTest

final class CalculatorTextButtonTests: XCTestCase {

    func testCalculatorTextButton() {
        let textButton = CalculatorTextButtonProtocolMock()
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 1

        textButton.style = style
        textButton.text = "1"

        let view = CalculatorTextButton(button: textButton)
        assertSnapshot(of: view, as: .image, record: true)
    }

    func testCalculatorTextButtonExpandedGridSpace() {
        let textButton = CalculatorTextButtonProtocolMock()
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 2

        textButton.style = style
        textButton.text = "1"

        let view = CalculatorTextButton(button: textButton)
        assertSnapshot(of: view, as: .image, record: true)
    }

}
