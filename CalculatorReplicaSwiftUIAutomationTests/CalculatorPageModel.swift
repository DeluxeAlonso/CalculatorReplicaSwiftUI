//
//  CalculatorPageModel.swift
//  CalculatorReplicaSwiftUIAutomationTests
//
//  Created by Alonso on 4/02/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import XCTest
import Foundation

final class CalculatorPageModel {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var one: XCUIElement { app.buttons["one"] }
    var two: XCUIElement { app.buttons["two"] }
    var three: XCUIElement { app.buttons["three"] }
    var four: XCUIElement { app.buttons["four"] }
    var five: XCUIElement { app.buttons["five"] }
    var six: XCUIElement { app.buttons["six"] }
    var seven: XCUIElement { app.buttons["seven"] }
    var eight: XCUIElement { app.buttons["eight"] }
    var nine: XCUIElement { app.buttons["nine"] }
    var zero: XCUIElement { app.buttons["zero"] }
    var decimal: XCUIElement { app.buttons["decimal"] }
    var exponent: XCUIElement { app.buttons["exponent"] }
    var clear: XCUIElement { app.buttons[ "clear"] }
    var sum: XCUIElement { app.buttons["sum"] }
    var subtraction: XCUIElement { app.buttons["subtraction"] }
    var multiplication: XCUIElement { app.buttons["multiplication"] }
    var division: XCUIElement { app.buttons["division"] }
    var percent: XCUIElement { app.buttons["percent"] }
    var negative: XCUIElement { app.buttons["negative"] }
    var equal: XCUIElement { app.buttons["equal"] }

    var resultDisplay: XCUIElement { app.staticTexts["result_display_view_text"].firstMatch }
}
