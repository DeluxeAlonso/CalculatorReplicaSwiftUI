//
//  CalculatorDisplayTrimmer.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 5/1/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

struct CalculatorDisplayTrimmer: CalculatorDisplayTrimmerProtocol {
    // MARK: - CalculatorDisplayTrimmerProtocol

    func getTrimmedCalculatorDisplay(_ calculatorDisplay: String) -> String {
        var trimmedCalculatorDisplay = calculatorDisplay.trimLeadingOcurrencesOf(.zero)
        
        if trimmedCalculatorDisplay.first == CalculatorButtonRepresentable.decimal.character {
            trimmedCalculatorDisplay.insert(CalculatorButtonRepresentable.zero.character, at: trimmedCalculatorDisplay.startIndex)
        }
        
        return trimmedCalculatorDisplay
    }
}
