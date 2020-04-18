//
//  CalculatorResultFormatter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class CalculatorResultFormatter: CalculatorResultFormatterProtocol {
    lazy var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 9
        return numberFormatter
    }()
    
    lazy var scientificFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .scientific
        numberFormatter.maximumIntegerDigits = 1
        numberFormatter.maximumFractionDigits = 8
        return numberFormatter
    }()
    
    func formatResult(from calculatorDisplay: String) -> String? {
        guard let largeNumber = Double(calculatorDisplay) else { return nil }
        let formatter = needsScientificFormat(calculatorDisplay: calculatorDisplay) ? scientificFormatter : numberFormatter
        if let formattedNumber = formatter.string(from: NSNumber(value:largeNumber)) {
            return formattedNumber
        }
        return nil
    }
    
    private func needsScientificFormat(calculatorDisplay: String) -> Bool {
        let exceedFractionDigitsLimit = calculatorDisplay.fractionDigitsCount() > Constants.calculatorDisplayMaxLimit
        let exceedIntegerDigitsLimit = calculatorDisplay.integerDigitsCount() > Constants.calculatorDisplayMaxLimit
        return exceedIntegerDigitsLimit || exceedFractionDigitsLimit
    }
}
