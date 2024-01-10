//
//  CalculatorButtonStyleProtocolMock.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 10/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import SwiftUI
@testable import Calculator

final class CalculatorButtonStyleProtocolMock: CalculatorButtonStyleProtocol {
    var gridSpace: Int = 0

    var tintColor: Color = .primary

    var backgroundColor: Color = .accentColor
}
