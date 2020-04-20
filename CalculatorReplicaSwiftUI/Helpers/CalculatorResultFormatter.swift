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
        numberFormatter.maximumFractionDigits = Constants.defaultMaximumFractionDigits
        return numberFormatter
    }()
    
    lazy var decimalFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = Constants.decimalMaximumFractionDigits
        numberFormatter.decimalSeparator = CalculatorConstants.decimal
        return numberFormatter
    }()
    
    lazy var scientificFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .scientific
        numberFormatter.maximumIntegerDigits = 1
        numberFormatter.maximumFractionDigits = Constants.scientificMaximumFractionDigits
        numberFormatter.decimalSeparator = CalculatorConstants.decimal
        numberFormatter.exponentSymbol = CalculatorConstants.exponentStringRepresentation
        return numberFormatter
    }()
    
    // MARK: - Private
    
    private func handleCalculatorDisplayWithExponent(_ number: Double) -> String? {
        guard let formattedNumber = formatNumber(number, with: scientificFormatter) else { return nil }
        return formattedNumber
    }
    
    private func handleCalculatorDisplayWithoutExponent(_ number: Double) -> String? {
        guard let preFormattedNumber = defaultFormatter.string(from: NSNumber(value:number)) else { return nil }
        let formatter = needsScientificFormat(calculatorDisplay: preFormattedNumber) ? scientificFormatter : decimalFormatter
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
    
    // MARK: - CalculatorResultFormatterProtocol
    
    func formatResult(from calculatorDisplay: String) -> String? {
        guard let number = Double(calculatorDisplay) else { return nil }
        if calculatorDisplay.hasExponent() {
            return handleCalculatorDisplayWithExponent(number)
        } else {
            return handleCalculatorDisplayWithoutExponent(number)
        }
    }
    
    func formatEnteredNumber(from calculatorDisplay: String) -> String? {
        let hasDecimal = calculatorDisplay.hasDecimal(checkForDecimalCharacter: true)
        let lastNonSignificantCharacters = calculatorDisplay.extractLastCharactersOf(CalculatorConstants.nonSignificantCharacters)
        
        // If the display contains non significant characters at the last, we add them after formatting it.
        if hasDecimal, !lastNonSignificantCharacters.isEmpty  {
            guard let formatted = formatResult(from: calculatorDisplay) else { return nil }
            return formatted + lastNonSignificantCharacters
        } else {
            return formatResult(from: calculatorDisplay)
        }
    }
}

extension CalculatorResultFormatter {
    struct Constants {
        static let decimalMaximumFractionDigits = 8
        static let scientificMaximumFractionDigits = 5
        static let defaultMaximumFractionDigits = 100
    }
}
