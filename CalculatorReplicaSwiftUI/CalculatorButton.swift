//
//  CalculatorButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/10/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

enum CalculatorButton {
    case one, two, three, four, five
    case six, seven, eight, nine, zero, dot
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .zero: return "0"
        case .dot: return "."
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .divide: return "/"
        case .plusMinus: return "+-"
        case .percent: return "%"
        case .ac: return "AC"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot, .zero:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        case .equals, .plus, .minus, .multiply, .divide:
            return Color(.orange)
        }
    }
}
