//
//  CalculatorContants.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/18/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

struct CalculatorConstants {
    static let nonSignificantCharacters: [Character] = [
        CalculatorOptionRepresentable.zero.rawValue.first!,
        CalculatorOptionRepresentable.decimal.rawValue.first!
    ]
}
