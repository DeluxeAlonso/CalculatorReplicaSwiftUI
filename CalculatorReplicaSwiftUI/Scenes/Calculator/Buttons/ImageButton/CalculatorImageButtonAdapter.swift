//
//  CalculatorImageButtonAdapter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 7/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import Foundation

struct CalculatorImageButtonAdapter: CalculatorImageButtonProtocol {
    let identifier: String
    let imageName: String
    let accessibilityLabel: String
    let style: CalculatorButtonStyleProtocol

    init?(_ calculatorButton: CalculatorButtonProtocol) {
        guard let imageName = calculatorButton.icon else { return nil }
        self.identifier = calculatorButton.identifier
        self.imageName = imageName
        self.accessibilityLabel = calculatorButton.accessibilityLabel
        self.style = calculatorButton.style
    }
}
