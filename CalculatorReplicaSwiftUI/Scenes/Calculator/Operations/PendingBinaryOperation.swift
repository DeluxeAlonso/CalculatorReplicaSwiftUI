//
//  PendingBinaryOperation.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

protocol PendingBinaryOperationProtocol {
    var hasOperand: Bool  { get }
    var operationPriority: Int { get }

    func setOperand(_ secondOperand: Double)
    func perform() -> Double
}

final class PendingBinaryOperation: PendingBinaryOperationProtocol {
    private let function: (Double, Double) -> Double
    private var accumulatedValue: Double
    private var operand: Double? = nil

    private(set) var operationPriority: Int
    
    init(function: @escaping (Double, Double) -> Double, firstOperand: Double, priority: Int) {
        self.function = function
        self.accumulatedValue = firstOperand
        self.operationPriority = priority
    }
    
    var hasOperand: Bool {
        return operand != nil
    }
    
    func setOperand(_ secondOperand: Double) {
        self.operand = secondOperand
    }
    
    /**
    * We save the current accumulated value in order to handle recurrent operations when tapping the equal button
    * more than once.
    */
    func perform() -> Double {
        guard let operand = operand else { return 0 }
        let value = function(accumulatedValue, operand)
        accumulatedValue = value
        return value
    }
}
