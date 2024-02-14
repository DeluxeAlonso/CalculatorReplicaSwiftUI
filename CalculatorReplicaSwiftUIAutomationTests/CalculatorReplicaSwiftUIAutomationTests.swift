//
//  CalculatorReplicaSwiftUIAutomationTests.swift
//  CalculatorReplicaSwiftUIAutomationTests
//
//  Created by Alonso on 19/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

@testable import Calculator
import XCTest

final class CalculatorReplicaSwiftUIAutomationTests: AutomationTestCase {

    private var pageModel: CalculatorPageModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        pageModel = CalculatorPageModel(app: app)

        launch()
    }

    override func tearDownWithError() throws {
        pageModel = nil
        try super.tearDownWithError()
    }

    func testAddDecimalNumber() throws {
        pageModel.zero.tap()
        pageModel.decimal.tap()
        pageModel.five.tap()
        pageModel.zero.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "0.50")
    }

    func testAddDecimalNumberWithMultipleDecimalTaps() throws {
        pageModel.zero.tap()

        pageModel.decimal.tap()
        pageModel.decimal.tap()
        pageModel.decimal.tap()

        pageModel.five.tap()
        pageModel.zero.tap()

        pageModel.decimal.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "0.50")
    }

    func testSimpleSum() throws {
        pageModel.nine.tap()
        pageModel.sum.tap()
        pageModel.five.tap()
        pageModel.equal.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "14")
    }

    func testRecurrentSum() throws {
        pageModel.nine.tap()
        pageModel.sum.tap()
        pageModel.five.tap()
        pageModel.equal.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "14")
        pageModel.equal.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "19")
        pageModel.equal.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "24")
    }

    func testSimpleSubtraction() throws {
        pageModel.one.tap()
        pageModel.zero.tap()
        pageModel.subtraction.tap()
        pageModel.five.tap()
        pageModel.equal.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "5")
    }

    func testRecurrentSubtraction() throws {
        pageModel.one.tap()
        pageModel.zero.tap()
        pageModel.subtraction.tap()
        pageModel.five.tap()
        pageModel.equal.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "5")
        pageModel.equal.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "0")
        pageModel.equal.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "-5")
    }

    func testSimpleMultiplication() throws {
        pageModel.one.tap()
        pageModel.zero.tap()
        pageModel.multiplication.tap()
        pageModel.five.tap()
        pageModel.equal.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "50")
    }

    func testRecurrentMultiplication() throws {
        pageModel.one.tap()
        pageModel.zero.tap()
        pageModel.multiplication.tap()
        pageModel.five.tap()
        pageModel.equal.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "50")
        pageModel.equal.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "250")
        pageModel.equal.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "1,250")
    }

    func testSimpleDivision() throws {
        pageModel.one.tap()
        pageModel.zero.tap()
        pageModel.division.tap()
        pageModel.five.tap()
        pageModel.equal.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "2")
    }

    func testRecurrentDivision() throws {
        pageModel.one.tap()
        pageModel.zero.tap()
        pageModel.division.tap()
        pageModel.five.tap()
        pageModel.equal.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "2")
        pageModel.equal.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "0.4")
        pageModel.equal.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "0.08")
    }

    func testNegativeOperation() throws {
        pageModel.one.tap()
        pageModel.zero.tap()
        pageModel.negative.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "-10")
        pageModel.negative.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "10")
    }

    func testPercentOperation() throws {
        pageModel.one.tap()
        pageModel.zero.tap()
        pageModel.percent.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "0.1")
        pageModel.percent.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "0.001")
    }

    func testClearOperation() throws {
        pageModel.one.tap()
        pageModel.zero.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "10")
        pageModel.clear.tap()
        XCTAssertEqual(pageModel.resultDisplay.label, "0")
    }

    func testStackedOnePriorityOperations() {
        pageModel.five.tap()
        pageModel.sum.tap()
        pageModel.six.tap()
        pageModel.subtraction.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "11")
    }

    func testSwipeToDelete() {
        pageModel.eight.tap()
        pageModel.eight.tap()
        pageModel.eight.tap()

        XCTAssertEqual(pageModel.resultDisplay.label, "888")
        pageModel.resultDisplay.swipeLeft()
        XCTAssertEqual(pageModel.resultDisplay.label, "88")
        pageModel.resultDisplay.swipeRight()
        XCTAssertEqual(pageModel.resultDisplay.label, "8")
        pageModel.resultDisplay.swipeLeft()
        XCTAssertEqual(pageModel.resultDisplay.label, "0")
    }

}
