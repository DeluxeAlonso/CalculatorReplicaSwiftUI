//
//  CalculatorEnvironmentObject.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Combine
import Foundation

final class CalculatorEnvironmentObject: ObservableObject {
    @UserDefaultsStorage("calculatorDisplay", defaultValue: "0")
    var formattedCalculatorDisplay: String {
        willSet {
            objectWillChange.send()
        }
    }
    
    let calculatorButtons: [[CalculatorButtonProtocol]]
    private let resultFormatter: CalculatorResultFormatterProtocol
    private var calculatorOperationHandler: CalculatorOperationHandlerProtocol

    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    init(calculatorButtons: [[CalculatorButtonProtocol]],
         resultFormatter: CalculatorResultFormatterProtocol,
         calculatorOperationHandler: CalculatorOperationHandlerProtocol) {
        self.calculatorButtons = calculatorButtons
        self.resultFormatter = resultFormatter
        self.calculatorOperationHandler = calculatorOperationHandler
        self.calculatorOperationHandler
            .calculatorDisplay
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] info in
                self?.updateValue(info.0, isEnteringNumbers: info.1)
            }.store(in: &cancellables)
    }

    // MARK: - Private

    private func updateValue(_ value: String, isEnteringNumbers: Bool) {
        if isEnteringNumbers {
            guard let formattedResult = resultFormatter.formatEnteredNumber(from: value) else { return }
            formattedCalculatorDisplay = formattedResult
        } else {
            guard let formattedResult = resultFormatter.formatResult(from: value) else { return }
            formattedCalculatorDisplay = formattedResult
        }
    }
    
    // MARK: - Public

    func handleCalculatorButton(_ calculatorButton: CalculatorButtonProtocol) {
        calculatorOperationHandler.handleCalculatorButton(calculatorButton)
    }

    func handleCalculatorButton(identifier: String) {
        guard let calculatorButton = calculatorButtons.flatMap({ $0 }).first(where: { $0.identifier == identifier }) else {
            return
        }
        calculatorOperationHandler.handleCalculatorButton(calculatorButton)
    }

    func deleteLastSingleDigit() {
        calculatorOperationHandler.deleteLastSingleDigit()
    }
}
