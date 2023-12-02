//
//  CalculatorButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorButton: CalculatorButtonProtocol {
    let title: String
    let icon: String?
    let accessibilityLabel: String
    let style: CalculatorButtonStyleProtocol
    let operation: CalculatorOperation?

    var isPlainNumber: Bool {
        return operation == nil
    }

    var shouldShowOnResultDisplay: Bool {
        guard let operation = operation else { return true }
        return operation == .decimal
    }
    
    // MARK: - Initializers
    
    init(title: String,
         icon: String?,
         accessibilityLabel: String,
         gridSpace: Int,
         foregroundColor: Color,
         backgroundColor: Color,
         operation: CalculatorOperation?) {
        self.title = title
        self.icon = icon
        self.accessibilityLabel = accessibilityLabel
        self.operation = operation
        self.style = CalculatorButtonStyle(gridSpace: gridSpace,
                                           tintColor: foregroundColor,
                                           backgroundColor: backgroundColor)
    }
    
    init(representable: CalculatorButtonRepresentable,
         gridSpace: Int = 1,
         foregroundColor: Color = Color(.white),
         backgroundColor: Color = Color(.darkGray)) {
        self.init(title: representable.rawValue,
                  icon: representable.icon,
                  accessibilityLabel: representable.accessibilityLabel,
                  gridSpace: gridSpace,
                  foregroundColor: foregroundColor,
                  backgroundColor: backgroundColor,
                  operation: representable.operation)
    }
}
