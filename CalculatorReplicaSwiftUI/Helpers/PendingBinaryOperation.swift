//
//  PendingBinaryOperation.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class PendingBinaryOperation {
    let function: (Double, Double) -> Double
    var firstOperand: Double
    var secondOperand: Double? = nil
    
    init(function: @escaping (Double, Double) -> Double, firstOperand: Double) {
        self.function = function
        self.firstOperand = firstOperand
    }
    
    var hasSecondOperand: Bool {
        return secondOperand != nil
    }
    
    func setSecondOperand(_ secondOperand: Double) {
        self.secondOperand = secondOperand
    }
    
    func perform() -> Double {
        guard let secondOperand = secondOperand else { return 0 }
        let value = function(firstOperand, secondOperand)
        firstOperand = value
        return value
    }
}
