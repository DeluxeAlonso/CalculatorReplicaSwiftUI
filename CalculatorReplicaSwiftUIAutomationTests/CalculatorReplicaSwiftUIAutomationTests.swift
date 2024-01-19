//
//  CalculatorReplicaSwiftUIAutomationTests.swift
//  CalculatorReplicaSwiftUIAutomationTests
//
//  Created by Alonso on 19/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import XCTest

final class CalculatorReplicaSwiftUIAutomationTests: XCTestCase {

    func testSum() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app.buttons["nine"].tap()
        app.buttons["sum"].tap()
        app.buttons["five"].tap()
        app.buttons["equal"].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertNotNil(resultDisplayText)
        XCTAssertEqual(resultDisplayText.label, "14")
    }

}
