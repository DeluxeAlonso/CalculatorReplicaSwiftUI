//
//  CalculatorTextButtonLegacyTests.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 12/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import SnapshotTesting
@testable import Calculator
import XCTest

final class CalculatorTextButtonLegacyTests: XCTestCase {

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
