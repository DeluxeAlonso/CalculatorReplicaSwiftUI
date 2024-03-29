//
//  CalculatorConstants.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/18/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

struct CalculatorConstants {
    static let nonSignificantCharacters: [Character] = [
        CalculatorButtonRepresentable.zero.rawValue.first,
        CalculatorButtonRepresentable.decimal.rawValue.first
    ].compactMap { $0 }
}
