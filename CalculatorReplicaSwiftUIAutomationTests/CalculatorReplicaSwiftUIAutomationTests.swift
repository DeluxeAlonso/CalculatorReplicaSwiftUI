//
//  CalculatorReplicaSwiftUIAutomationTests.swift
//  CalculatorReplicaSwiftUIAutomationTests
//
//  Created by Alonso on 19/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import XCTest

final class CalculatorReplicaSwiftUIAutomationTests: XCTestCase {

    func testAddDecimalNumber() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["zero"].tap()
        app.buttons["decimal"].tap()
        app.buttons["five"].tap()
        app.buttons["zero"].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertNotNil(resultDisplayText)
        XCTAssertEqual(resultDisplayText.label, "0.50")
    }

    func testAddDecimalNumberWithMultipleDecimalTaps() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["zero"].tap()

        app.buttons["decimal"].tap()
        app.buttons["decimal"].tap()
        app.buttons["decimal"].tap()

        app.buttons["five"].tap()
        app.buttons["zero"].tap()

        app.buttons["decimal"].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertNotNil(resultDisplayText)
        XCTAssertEqual(resultDisplayText.label, "0.50")
    }

    func testSimpleSum() throws {
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

    func testSimpleSubtraction() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["one"].tap()
        app.buttons["zero"].tap()
        app.buttons["subtraction"].tap()
        app.buttons["five"].tap()
        app.buttons["equal"].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertNotNil(resultDisplayText)
        XCTAssertEqual(resultDisplayText.label, "5")
    }

    func testSimpleMultiplication() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["one"].tap()
        app.buttons["zero"].tap()
        app.buttons["multiplication"].tap()
        app.buttons["five"].tap()
        app.buttons["equal"].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertNotNil(resultDisplayText)
        XCTAssertEqual(resultDisplayText.label, "50")
    }

    func testSimpleDivision() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["one"].tap()
        app.buttons["zero"].tap()
        app.buttons["division"].tap()
        app.buttons["five"].tap()
        app.buttons["equal"].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertNotNil(resultDisplayText)
        XCTAssertEqual(resultDisplayText.label, "2")
    }

}
