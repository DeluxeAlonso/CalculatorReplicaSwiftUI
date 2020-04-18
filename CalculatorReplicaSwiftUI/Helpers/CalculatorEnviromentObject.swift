//
//  CalculatorEnviromentObject.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
import Combine

class CalculatorEnviromentObject: ObservableObject, CalculatorEnvironmentObjectProtocol {
    
    @Published var formattedCalculatorDisplay: String = "0"
    
    let calculatorButtons: [[CalculatorOptionProtocol]]
    private let resultFormatter: CalculatorResultFormatterProtocol
    private var calculatorOperationHandler: CalculatorOperationHandlerProtocol
    
    // MARK: - Initializers
    
    init(calculatorButtons: [[CalculatorOptionProtocol]],
         resultFormatter: CalculatorResultFormatterProtocol,
         calculatorOperationHandler: CalculatorOperationHandlerProtocol) {
        self.calculatorButtons = calculatorButtons
        self.resultFormatter = resultFormatter
        self.calculatorOperationHandler = calculatorOperationHandler
        self.calculatorOperationHandler.delegate = self
    }
    
    // MARK: - Public
    
    func handleCalculatorOption(_ calculatorOption: CalculatorOptionProtocol) {
        calculatorOperationHandler.handleCalculatorOption(calculatorOption)
    }
    
    // MARK: - CalculatorEnvironmentObjectProtocol
    
    func updateValue(_ value: String) {
        guard let formattedResult = resultFormatter.formatResult(from: value) else { return }
        formattedCalculatorDisplay = formattedResult
    }
    
}

extension CalculatorEnviromentObject {
    static let calculatorDisplayMaxLimit = 9
    static let numberOfButtonsPerRow = 4
}
