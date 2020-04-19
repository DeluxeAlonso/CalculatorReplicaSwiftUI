//
//  CalculatorResultFormatter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class CalculatorResultFormatter: CalculatorResultFormatterProtocol {
    
    lazy var defaultFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        numberFormatter.maximumFractionDigits = 100
        return numberFormatter
    }()
    
    lazy var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 8
        return numberFormatter
    }()
    
    lazy var scientificFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .scientific
        numberFormatter.maximumIntegerDigits = 1
        numberFormatter.maximumFractionDigits = Constants.scientificMaximumFractionDigits
        numberFormatter.exponentSymbol = CalculatorConstants.exponentStringRepresentation
        return numberFormatter
    }()
    
    func formatResult(from calculatorDisplay: String) -> String? {
        guard let number = Double(calculatorDisplay) else { return nil }
        if calculatorDisplay.hasExponent() {
            return handleCalculatorDisplayWithExponent(number)
        } else {
            return handleCalculatorDisplayWithoutExponent(number)
        }
    }
    
    private func handleCalculatorDisplayWithExponent(_ number: Double) -> String? {
        guard let formattedNumber = formatNumber(number, with: scientificFormatter) else { return nil }
        return formattedNumber
    }
    
    private func handleCalculatorDisplayWithoutExponent(_ number: Double) -> String? {
        guard let preFormattedNumber = defaultFormatter.string(from: NSNumber(value:number)) else { return nil }
        let formatter = needsScientificFormat(calculatorDisplay: preFormattedNumber) ? scientificFormatter : numberFormatter
        guard let formattedNumber = formatNumber(number, with: formatter) else { return nil }
        return formattedNumber
    }
    
    private func needsScientificFormat(calculatorDisplay: String) -> Bool {
        let fractionDigitsCount = min(calculatorDisplay.fractionDigitsCount(), Constants.scientificMaximumFractionDigits)
        let integerDigitsCount = calculatorDisplay.integerDigitsCount()
        return fractionDigitsCount + integerDigitsCount > CalculatorConstants.calculatorDisplayMaxLimit
    }
    
    private func formatNumber(_ number: Double, with formatter: NumberFormatter) -> String? {
        guard let formattedNumber = formatter.string(from: NSNumber(value:number)) else {
            return nil
        }
        return formattedNumber.removeNonSignificantExponents()
    }
}

extension CalculatorResultFormatter {
    struct Constants {
        static let scientificMaximumFractionDigits = 5
    }
}
