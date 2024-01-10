//
//  CalculatorTextButtonProtocolMock.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 10/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import SwiftUI
@testable import Calculator

final class CalculatorTextButtonProtocolMock: CalculatorTextButtonProtocol {
    var identifier: String = ""

    var text: String = ""

    var accessibilityLabel: String = ""

    var style: CalculatorButtonStyleProtocol = CalculatorButtonStyleProtocolMock()
}
