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
    
    var isPlainNumber: Bool {
        return operation == nil
    }
    
    var shouldShowOnResultDisplay: Bool {
        guard let operation = operation else { return true }
        return operation == .decimal
    }
    
    var gridSpace: Int = 1
    
    var backgroundColor: Color = Color(.darkGray)
    
    var operation: CalculatorOperation?
    
    // MARK: - Initializers
    
    init(title: String, gridSpace: Int = 1,
         backgroundColor: Color = Color(.darkGray),
         operation: CalculatorOperation? = nil) {
        self.title = title
        self.gridSpace = gridSpace
        self.backgroundColor = backgroundColor
        self.operation = operation
    }
    
    init(representable: CalculatorOptionRepresentable, gridSpace: Int = 1,
         backgroundColor: Color = Color(.darkGray), operation: CalculatorOperation? = nil) {
        self.init(title: representable.rawValue, gridSpace: gridSpace,
                  backgroundColor: backgroundColor, operation: operation)
    }
}
