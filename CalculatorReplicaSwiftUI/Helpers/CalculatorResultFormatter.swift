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
        numberFormatter.maximumFractionDigits = 6
        return numberFormatter
    }()
    
    func formatResult(from calculatorDisplay: String) -> String? {
        guard let number = Double(calculatorDisplay) else { return nil }
        let formatter = needsScientificFormat(calculatorDisplay: calculatorDisplay) ? scientificFormatter : numberFormatter
        guard let formattedNumber = formatNumber(number, with: formatter) else { return nil }
        return formattedNumber
    }
    
    private func needsScientificFormat(calculatorDisplay: String) -> Bool {
        let exceedFractionDigitsLimit = calculatorDisplay.fractionDigitsCount() > CalculatorConstants.calculatorDisplayMaxLimit
        let exceedIntegerDigitsLimit = calculatorDisplay.integerDigitsCount() > CalculatorConstants.calculatorDisplayMaxLimit
        return exceedIntegerDigitsLimit || exceedFractionDigitsLimit
    }
    
    private func formatNumber(_ number: Double, with formatter: NumberFormatter) -> String? {
        guard let formattedNumber = formatter.string(from: NSNumber(value:number)) else {
            return nil
        }
        return formattedNumber.removeNonSignificantExponents()
    }
}
