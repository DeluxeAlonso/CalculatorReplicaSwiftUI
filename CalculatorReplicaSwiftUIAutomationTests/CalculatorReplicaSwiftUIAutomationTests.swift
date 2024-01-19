//
//  CalculatorReplicaSwiftUIAutomationTests.swift
//  CalculatorReplicaSwiftUIAutomationTests
//
//  Created by Alonso on 19/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import XCTest

final class CalculatorReplicaSwiftUIAutomationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSum() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app.buttons["nine"].tap()
        app.buttons["sum"].tap()
        app.buttons["five"].tap()
        app.buttons["equal"].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"]
        XCTAssertNotNil(resultDisplayText)
        XCTAssertEqual(resultDisplayText.description, "14")
    }
}
