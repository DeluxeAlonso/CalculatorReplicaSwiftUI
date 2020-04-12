//
//  GlobalEnviroment.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Combine

class GlobalEnviroment: ObservableObject {
    @Published var calculatorDisplay: String = ""
    
    private var currentOptions: [CalculatorOptionProtocol] = []
    
    let calculatorButtons: [[CalculatorOptionProtocol]]
    
    var numberOfButtonsPerRow: Int? {
        return calculatorButtons.first?.count
    }
    
    var isMaxLimit: Bool {
        return currentOptions.filter { $0.isPlainNumber }.count < Constants.maxLimit
    }
    
    init(calculatorButtons: [[CalculatorOptionProtocol]]) {
        self.calculatorButtons = calculatorButtons
    }
    
    func isOptionAlreadyPresent(_ calculatorOption: CalculatorOptionProtocol) -> Bool {
        return calculatorDisplay.contains(calculatorOption.title)
    }
    
    func updateCalculatorDisplay(calculatorOption: CalculatorOptionProtocol) {
        if !calculatorOption.isPlainNumber {
            guard !isOptionAlreadyPresent(calculatorOption) else { return }
        }
        guard isMaxLimit else { return }
        currentOptions.append(calculatorOption)
        calculatorDisplay += calculatorOption.title
    }
}

extension GlobalEnviroment {
    struct Constants {
        static let maxLimit = 9
    }
}
