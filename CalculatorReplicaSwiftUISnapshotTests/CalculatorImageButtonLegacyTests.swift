//
//  CalculatorImageButtonLegacyTests.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 12/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import SnapshotTesting
@testable import Calculator
import XCTest

final class CalculatorImageButtonLegacyTests: XCTestCase {

    func testCalculatorImageButton() {
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 1

        let view = CalculatorImageButtonLegacy(imageName: "plus", style: style)
        assertSnapshot(of: view, as: .image)
    }

    func testCalculatorImageButtonExpandedGridSpace() {
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 2

        let view = CalculatorImageButtonLegacy(imageName: "plus", style: style)
        assertSnapshot(of: view, as: .image)
    }

}
