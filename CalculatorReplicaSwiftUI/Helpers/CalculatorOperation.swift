//
//  CalculatorOperation.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

enum CalculatorOperation: Equatable, Hashable {
    case constant(Double)
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
    case equals
    case clear
    case blank
    
    // MARK: - Equatable
    
    static func == (lhs: CalculatorOperation, rhs: CalculatorOperation) -> Bool {
        switch (lhs, rhs) {
        case (constant(let lhsValue), constant(let rhsValue)): return lhsValue == rhsValue
        case (equals, equals): return true
        case (clear, clear): return true
        case (blank, blank): return true
        case (unaryOperation, unaryOperation): return true
        case (binaryOperation, binaryOperation): return true
        default: return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
}
