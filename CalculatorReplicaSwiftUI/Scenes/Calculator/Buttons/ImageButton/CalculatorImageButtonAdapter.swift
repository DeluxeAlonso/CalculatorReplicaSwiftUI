//
//  CalculatorImageButtonAdapter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 7/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

struct CalculatorImageButtonAdapter: CalculatorImageButtonProtocol {
    let identifier: String
    let imageName: String
    let accessibilityLabel: String
    let style: CalculatorButtonStyleProtocol

    init(identifier: String, imageName: String, accessibilityLabel: String, style: CalculatorButtonStyleProtocol) {
        self.identifier = identifier
        self.imageName = imageName
        self.accessibilityLabel = accessibilityLabel
        self.style = style
    }

    init?(_ calculatorButton: CalculatorButtonProtocol) {
        guard let imageName = calculatorButton.icon else { return nil }
        self.identifier = calculatorButton.identifier
        self.imageName = imageName
        self.accessibilityLabel = calculatorButton.accessibilityLabel
        self.style = calculatorButton.style
    }
}
