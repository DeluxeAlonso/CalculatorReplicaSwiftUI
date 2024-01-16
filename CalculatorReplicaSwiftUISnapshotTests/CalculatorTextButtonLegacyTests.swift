//
//  CalculatorTextButtonLegacyTests.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 12/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

@testable import Calculator

final class CalculatorTextButtonLegacyTests: SnapshotTestCase {

    func testCalculatorTextButton() {
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 1

        let view = CalculatorTextButtonLegacy(text: "1", style: style)
        assertSnapshotImage(of: view)
    }

    func testCalculatorTextButtonExpandedGridSpace() {
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 2

        let view = CalculatorTextButtonLegacy(text: "1", style: style)
        assertSnapshotImage(of: view)
    }

}
