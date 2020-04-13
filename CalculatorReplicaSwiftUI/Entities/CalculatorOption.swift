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
        return operation == .blank
    }
    
    var gridSpace: Int = 1
    
    var backgroundColor: Color = Color(.darkGray)
    
    var operation: CalculatorOperation?
}
