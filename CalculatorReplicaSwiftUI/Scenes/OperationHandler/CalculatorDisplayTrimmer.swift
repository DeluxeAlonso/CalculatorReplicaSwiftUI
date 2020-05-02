//
//  CalculatorDisplayTrimmer.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 5/1/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

struct CalculatorDisplayTrimmer: CalculatorDisplayTrimmerProtocol {
    func getTrimmedCalculatorDisplay(_ calculatorDisplay: String) -> String {
        var trimmedCalculatorDisplay = calculatorDisplay.trimLeadingOcurrencesOf(CalculatorOptionRepresentable.zero.character)
        
        if trimmedCalculatorDisplay.first == CalculatorOptionRepresentable.decimal.character {
            trimmedCalculatorDisplay.insert(CalculatorOptionRepresentable.zero.character, at: trimmedCalculatorDisplay.startIndex)
        }
        
        return trimmedCalculatorDisplay
    }
}
