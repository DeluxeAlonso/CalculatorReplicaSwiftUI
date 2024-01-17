//
//  CalculatorOperation.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

enum CalculatorOperation: Equatable {
    case unaryOperation((Double) -> Double)
    case binaryOperation(BinaryOperation)
    case equals
    case clear
    case decimal

    var shouldShowOnResultDisplay: Bool {
        switch self {
        case .unaryOperation, .binaryOperation, .equals, .clear:
            return false
        case .decimal:
            return true
        }
    }
    
    // MARK: - Equatable
    
    static func == (lhs: CalculatorOperation, rhs: CalculatorOperation) -> Bool {
        switch (lhs, rhs) {
        case (equals, equals): return true
        case (clear, clear): return true
        case (decimal, decimal): return true
        case (unaryOperation, unaryOperation): return true
        case (binaryOperation, binaryOperation): return true
        default: return false
        }
    }
}
