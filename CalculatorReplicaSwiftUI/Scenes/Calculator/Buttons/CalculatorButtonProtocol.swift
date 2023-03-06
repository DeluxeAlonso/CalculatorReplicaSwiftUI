//
//  CalculatorButtonProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

protocol CalculatorButtonProtocol {    
    var title: String { get }

    var icon: String? { get }

    var accessibilityLabel: String { get }

    var gridSpace: Int { get }
    var tintColor: Color { get }
    var backgroundColor: Color { get }
    var operation: CalculatorOperation? { get }

    /// Indicates if the calculator button is a plain number and not an operation.
    var isPlainNumber: Bool { get }
    var shouldShowOnResultDisplay: Bool { get }
}
