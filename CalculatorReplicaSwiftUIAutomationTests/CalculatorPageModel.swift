//
//  CalculatorPageModel.swift
//  CalculatorReplicaSwiftUIAutomationTests
//
//  Created by Alonso on 4/02/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import XCTest
import Foundation
@testable import Calculator

final class CalculatorPageModel {
    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    subscript(representable: CalculatorButtonRepresentable) -> XCUIElement {
        app.buttons[representable.identifier]
    }
}
