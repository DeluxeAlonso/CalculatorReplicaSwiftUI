//
//  String+Replacing.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/18/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

extension String {
    func replacingOccurrences<Target, Replacement>(of targets: [Target], with replacement: Replacement) -> String where Target : StringProtocol, Replacement : StringProtocol {
        var newString = self
        for target in targets {
            newString = newString.replacingOccurrences(of: target, with: replacement)
        }
        return newString
    }
    
    func removeNonSignificantExponents() -> String {
        let positiveNonSignificantExponent = "\(CalculatorConstants.exponentStringRepresentation)"
        let negativeNonSignificantExponent = "-\(CalculatorConstants.exponentStringRepresentation)"
        return lowercased().replacingOccurrences(of: [positiveNonSignificantExponent, negativeNonSignificantExponent], with: "")
    }
}
