//
//  CalculatorTextButtonAdapter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 7/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import Foundation

struct CalculatorTextButtonAdapter: CalculatorTextButtonProtocol {
    let identifier: String
    let text: String
    let accessibilityLabel: String
    let style: CalculatorButtonStyleProtocol

    init(_ calculatorButton: CalculatorButtonProtocol) {
        self.identifier = calculatorButton.identifier
        self.text = calculatorButton.title
        self.accessibilityLabel = calculatorButton.accessibilityLabel
        self.style = calculatorButton.style
    }
}
