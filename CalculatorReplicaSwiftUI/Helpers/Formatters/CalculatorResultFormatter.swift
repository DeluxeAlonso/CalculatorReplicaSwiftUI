//
//  CalculatorResultFormatter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class CalculatorResultFormatter: CalculatorResultFormatterProtocol {
    
    private lazy var defaultFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        return numberFormatter
    }()
    
    private lazy var decimalFormatter: DecimalFormatter = {
        let numberFormatter = DecimalFormatter()
        return numberFormatter
    }()
    
    private lazy var scientificFormatter: ScientificFormatter = {
        let numberFormatter = ScientificFormatter()
        return numberFormatter
    }()

    // MARK: - Dependencies
    
    private let calculatorConfiguration: CalculatorConfigurationProtocol
    
    // MARK: - Initializers

    init(calculatorConfiguration: CalculatorConfigurationProtocol) {
        self.calculatorConfiguration = calculatorConfiguration
    }
    
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
        let fractionDigitsCount = min(calculatorDisplay.fractionDigitsCount(), scientificFormatter.maximumFractionDigits)
        let integerDigitsCount = calculatorDisplay.integerDigitsCount()
        return fractionDigitsCount + integerDigitsCount > calculatorConfiguration.calculatorDisplayMaxLimit
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
        let lastNonSignificantCharacters = calculatorDisplay.extractLastCharactersOf(CalculatorConstants.nonSignificantCharacters, withCutCharacter: CalculatorButtonRepresentable.decimal.character)
        
        // If the display contains non significant characters at the last, we add them after formatting it.
        if hasDecimal, !lastNonSignificantCharacters.isEmpty  {
            guard let formatted = formatResult(from: calculatorDisplay) else { return nil }
            return formatted + lastNonSignificantCharacters
        } else {
            return formatResult(from: calculatorDisplay)
        }
    }
}
