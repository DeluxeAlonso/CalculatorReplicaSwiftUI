//
//  CalculatorOperation.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

enum CalculatorOperation: Equatable {
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
    case equals
    case clear
    case decimal
    
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
