//
//  CalculatorTextButtonProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 7/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

protocol CalculatorTextButtonProtocol {
    var identifier: String { get }
    var text: String { get }
    var accessibilityLabel: String { get }
    var style: CalculatorButtonStyleProtocol { get }
}
