//
//  CalculatorTextButtonAdapter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 7/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

struct CalculatorTextButtonAdapter: CalculatorTextButtonProtocol {
    let identifier: String
    let text: String
    let accessibilityLabel: String
    let style: CalculatorButtonStyleProtocol

    init(identifier: String, text: String, accessibilityLabel: String, style: CalculatorButtonStyleProtocol) {
        self.identifier = identifier
        self.text = text
        self.accessibilityLabel = accessibilityLabel
        self.style = style
    }

    init(_ calculatorButton: CalculatorButtonProtocol) {
        self.identifier = calculatorButton.identifier
        self.text = calculatorButton.title
        self.accessibilityLabel = calculatorButton.accessibilityLabel
        self.style = calculatorButton.style
    }
}
