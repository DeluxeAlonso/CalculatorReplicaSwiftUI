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
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 1

        let view = CalculatorTextButtonLegacy(text: "1", style: style)
        assertSnapshot(of: view, as: .image)
    }

    func testCalculatorTextButtonExpandedGridSpace() {
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 2

        let view = CalculatorTextButtonLegacy(text: "1", style: style)
        assertSnapshot(of: view, as: .image)
    }

}
