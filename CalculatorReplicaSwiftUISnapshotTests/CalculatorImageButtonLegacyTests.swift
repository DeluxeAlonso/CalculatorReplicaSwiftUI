//
//  CalculatorImageButtonLegacyTests.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 12/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

@testable import Calculator

final class CalculatorImageButtonLegacyTests: SnapshotTestCase {

    func testCalculatorImageButton() {
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 1

        let view = CalculatorImageButtonLegacy(imageName: "plus", style: style)
        assertSnapshotImage(of: view)
    }

    func testCalculatorImageButtonExpandedGridSpace() {
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 2

        let view = CalculatorImageButtonLegacy(imageName: "plus", style: style)
        assertSnapshotImage(of: view)
    }

}
