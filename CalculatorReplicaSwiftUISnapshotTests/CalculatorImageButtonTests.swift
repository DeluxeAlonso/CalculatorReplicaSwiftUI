//
//  CalculatorImageButtonTests.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 10/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

@testable import Calculator
import SnapshotTesting
import XCTest

final class CalculatorImageButtonTests: XCTestCase {

    func testCalculatorImageButton() {
        let imageButton = CalculatorImageButtonProtocolMock()
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 1

        imageButton.style = style
        imageButton.imageName = "plus"

        let view = CalculatorImageButton(button: imageButton)
        assertSnapshot(of: view, as: .image, record: true)
    }

    func testCalculatorImageButtonExpandedGridSpace() {
        let imageButton = CalculatorImageButtonProtocolMock()
        let style = CalculatorButtonStyleProtocolMock()
        style.gridSpace = 2

        imageButton.style = style
        imageButton.imageName = "plus"

        let view = CalculatorImageButton(button: imageButton)
        assertSnapshot(of: view, as: .image, record: true)
    }

}
