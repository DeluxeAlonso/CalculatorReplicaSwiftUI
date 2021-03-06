//
//  CalculatorOption.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorOption: CalculatorOptionProtocol {
    var title: String
    var icon: String?

    var accessibilityLabel: String
    
    var isPlainNumber: Bool {
        return operation == nil
    }
    
    var shouldShowOnResultDisplay: Bool {
        guard let operation = operation else { return true }
        return operation == .decimal
    }
    
    var gridSpace: Int
    var tintColor: Color
    var backgroundColor: Color
    var operation: CalculatorOperation?
    
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
        self.gridSpace = gridSpace
        self.tintColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.operation = operation
    }
    
    init(representable: CalculatorOptionRepresentable,
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
