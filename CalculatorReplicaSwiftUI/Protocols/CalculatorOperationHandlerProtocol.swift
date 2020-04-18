//
//  CalculatorOperationHandlerProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

protocol CalculatorOperationHandlerProtocol {
    var delegate: CalculatorEnvironmentObjectProtocol? { get set }
    
    func handleCalculatorOption(_ calculatorOption: CalculatorOptionProtocol)
}
