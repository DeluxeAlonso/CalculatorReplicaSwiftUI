//
//  CalculatorReplicaSwiftUIAutomationTests.swift
//  CalculatorReplicaSwiftUIAutomationTests
//
//  Created by Alonso on 19/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

@testable import Calculator
import XCTest

final class CalculatorReplicaSwiftUIAutomationTests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }

    func testAddDecimalNumber() throws {
        app.buttons[.zero].tap()
        app.buttons[.decimal].tap()
        app.buttons[.five].tap()
        app.buttons[.zero].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "0.50")
    }

    func testAddDecimalNumberWithMultipleDecimalTaps() throws {
        app.buttons[.zero].tap()

        app.buttons[.decimal].tap()
        app.buttons[.decimal].tap()
        app.buttons[.decimal].tap()

        app.buttons[.five].tap()
        app.buttons[.zero].tap()

        app.buttons[.decimal].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "0.50")
    }

    func testSimpleSum() throws {
        app.buttons[.nine].tap()
        app.buttons[.sum].tap()
        app.buttons[.five].tap()
        app.buttons[.equal].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "14")
    }

    func testRecurrentSum() throws {
        app.buttons[.nine].tap()
        app.buttons[.sum].tap()
        app.buttons[.five].tap()
        app.buttons[.equal].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "14")
        app.buttons[.equal].tap()
        XCTAssertEqual(resultDisplayText.label, "19")
        app.buttons[.equal].tap()
        XCTAssertEqual(resultDisplayText.label, "24")
    }

    func testSimpleSubtraction() throws {
        app.buttons[.one].tap()
        app.buttons[.zero].tap()
        app.buttons[.subtraction].tap()
        app.buttons[.five].tap()
        app.buttons[.equal].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "5")
    }

    func testRecurrentSubtraction() throws {
        app.buttons[.one].tap()
        app.buttons[.zero].tap()
        app.buttons[.subtraction].tap()
        app.buttons[.five].tap()
        app.buttons[.equal].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "5")
        app.buttons[.equal].tap()
        XCTAssertEqual(resultDisplayText.label, "0")
        app.buttons[.equal].tap()
        XCTAssertEqual(resultDisplayText.label, "-5")
    }

    func testSimpleMultiplication() throws {
        app.buttons[.one].tap()
        app.buttons[.zero].tap()
        app.buttons[.multiplication].tap()
        app.buttons[.five].tap()
        app.buttons[.equal].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "50")
    }

    func testRecurrentMultiplication() throws {
        app.buttons[.one].tap()
        app.buttons[.zero].tap()
        app.buttons[.multiplication].tap()
        app.buttons[.five].tap()
        app.buttons[.equal].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "50")
        app.buttons[.equal].tap()
        XCTAssertEqual(resultDisplayText.label, "250")
        app.buttons[.equal].tap()
        XCTAssertEqual(resultDisplayText.label, "1,250")
    }

    func testSimpleDivision() throws {
        app.buttons[.one].tap()
        app.buttons[.zero].tap()
        app.buttons[.division].tap()
        app.buttons[.five].tap()
        app.buttons[.equal].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "2")
    }

    func testRecurrentDivision() throws {
        app.buttons[.one].tap()
        app.buttons[.zero].tap()
        app.buttons[.division].tap()
        app.buttons[.five].tap()
        app.buttons[.equal].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "2")
        app.buttons[.equal].tap()
        XCTAssertEqual(resultDisplayText.label, "0.4")
        app.buttons[.equal].tap()
        XCTAssertEqual(resultDisplayText.label, "0.08")
    }

    func testNegativeOperation() throws {
        app.buttons[.one].tap()
        app.buttons[.zero].tap()
        app.buttons[.negative].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "-10")
        app.buttons[.negative].tap()
        XCTAssertEqual(resultDisplayText.label, "10")
    }

    func testPercentOperation() throws {
        app.buttons[.one].tap()
        app.buttons[.zero].tap()
        app.buttons[.percent].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "0.1")
        app.buttons[.percent].tap()
        XCTAssertEqual(resultDisplayText.label, "0.001")
    }

    func testClearOperation() throws {
        app.buttons[.one].tap()
        app.buttons[.zero].tap()
        app.buttons[.clear].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "0")
    }

    func testStackedOnePriorityOperations() {
        app.buttons[.five].tap()
        app.buttons[.sum].tap()
        app.buttons[.six].tap()
        app.buttons[.subtraction].tap()

        let resultDisplayText = app.staticTexts["result_display_view_text"].firstMatch
        XCTAssertEqual(resultDisplayText.label, "11")
    }

}
