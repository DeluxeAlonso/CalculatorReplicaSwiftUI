//
//  CalculatorButtonProtocolMock.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 12/11/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import SwiftUI
@testable import Calculator

final class CalculatorButtonProtocolMock: CalculatorButtonProtocol {
    var identifier: String = ""

    var accessibilityIdentifier: String = ""

    var title: String = ""

    var icon: String?

    var accessibilityLabel: String = ""

    var style: CalculatorButtonStyleProtocol = CalculatorButtonStyleProtocolMock()

    var operation: CalculatorOperation?

    var isPlainNumber: Bool = false

    var shouldShowOnResultDisplay: Bool = true
}
