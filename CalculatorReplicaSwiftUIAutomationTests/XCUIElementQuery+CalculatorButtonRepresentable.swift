//
//  XCUIElementQuery+CalculatorButtonRepresentable.swift
//  CalculatorReplicaSwiftUIAutomationTests
//
//  Created by Alonso on 3/02/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

@testable import Calculator
import XCTest

extension XCUIElementQuery {

    subscript(representable: CalculatorButtonRepresentable) -> XCUIElement {
        self[representable.accessibilityLabel]
    }

    func callAsFunction(_ representable: CalculatorButtonRepresentable) -> XCUIElement {
        self[representable.accessibilityLabel]
    }

}
