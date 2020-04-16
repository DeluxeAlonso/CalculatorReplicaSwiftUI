//
//  CalculatorResultFormatterProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

protocol CalculatorResultFormatterProtocol: class {
    func formatResult(from calculatorDisplay: String) -> String?
}
