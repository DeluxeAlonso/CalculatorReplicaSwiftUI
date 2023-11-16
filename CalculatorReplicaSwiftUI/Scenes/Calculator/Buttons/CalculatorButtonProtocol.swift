//
//  CalculatorButtonProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

protocol CalculatorButtonProtocol: CalculatorButtonStyleProtocol {
    var contentType: CalculatorButtonContentType { get }

    var accessibilityLabel: String { get }
    var operation: CalculatorOperation? { get }

    /// Indicates if the calculator button is a plain number and not an operation.
    var isPlainNumber: Bool { get }
    var shouldShowOnResultDisplay: Bool { get }
}

protocol CalculatorButtonStyleProtocol {
    var gridSpace: Int { get }
    var tintColor: Color { get }
    var backgroundColor: Color { get }
}

enum CalculatorButtonContentType {
    case title(String)
    case icon(String)
}
