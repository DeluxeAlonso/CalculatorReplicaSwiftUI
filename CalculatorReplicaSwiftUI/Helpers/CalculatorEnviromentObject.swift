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
    
    private let resultFormatter: CalculatorResultFormatterProtocol
    let calculatorButtons: [[CalculatorOptionProtocol]]
    private let calculatorOperationHandler: CalculatorOperationHadler
    
    var numberOfButtonsPerRow: Int? {
        return calculatorButtons.first?.count
    }
    
    // MARK: - Initializers
    
    init(calculatorButtons: [[CalculatorOptionProtocol]],
         resultFormatter: CalculatorResultFormatterProtocol,
         calculatorOperationHandler: CalculatorOperationHadler) {
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
