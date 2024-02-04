//
//  AutomationTestCase.swift
//  CalculatorReplicaSwiftUIAutomationTests
//
//  Created by Alonso on 4/02/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import XCTest

class AutomationTestCase: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }

    func launch() {
        app.launch()
    }

}
