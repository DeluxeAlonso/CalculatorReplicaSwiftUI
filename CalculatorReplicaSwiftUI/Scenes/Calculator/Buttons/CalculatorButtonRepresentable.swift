//
//  CalculatorButtonRepresentable.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/20/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

enum CalculatorButtonRepresentable: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    case exponent = "e"
    case clear = "AC"
    case sum = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    case percent = "%"
    case negative = "+-"
    case equal = "="
    
    var character: Character {
        return rawValue.first ?? Character(rawValue)
    }

    var identifier: String {
        switch self {
        case .one: return "one"
        case .two: return "two"
        case .three: return "three"
        case .four: return "four"
        case .five: return "five"
        case .six: return "six"
        case .seven: return "seven"
        case .eight: return "eight"
        case .nine: return "nine"
        case .zero: return "zero"
        case .decimal: return "decimal"
        case .exponent: return "exponent"
        case .clear: return  "clear"
        case .sum: return "sum"
        case .subtraction: return "subtraction"
        case .multiplication: return "multiplication"
        case .division: return "division"
        case .percent: return "percent"
        case .negative: return "negative"
        case .equal: return "equal"
        }
    }

    var accessibilityLabel: String {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            return self.rawValue
        case .sum, .subtraction, .multiplication, .division, .percent, .negative:
            return self.rawValue
        case .decimal:
            return "Decimal"
        case .exponent:
            return "Exponent"
        case .clear:
            return "All clear"
        case .equal:
            return "Equals"
        }
    }
    
    var icon: String? {
        switch self {
        case .sum: return "plus"
        case .subtraction: return "minus"
        case .multiplication: return "multiply"
        case .division: return "divide"
        case .percent: return "percent"
        case .negative: return "plus.slash.minus"
        case .equal: return "equal"
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            return nil
        case .exponent, .clear, .decimal:
            return nil
        }
    }
    
    var operation: CalculatorOperation? {
        switch self {
        case .clear:
            return .clear
        case .sum:
            return .binaryOperation(BinaryOperation(function: { $0 + $1 }, priority: 1))
        case .subtraction:
            return .binaryOperation(BinaryOperation(function: { $0 - $1 }, priority: 1))
        case .multiplication:
            return .binaryOperation(BinaryOperation(function: { $0 * $1 }, priority: 2))
        case .division:
            return .binaryOperation(BinaryOperation(function: { $0 / $1 }, priority: 2))
        case .percent:
            return .unaryOperation({ $0 * 0.01 })
        case .negative:
            return .unaryOperation({ -$0 })
        case .equal:
            return .equals
        case .decimal:
            return .decimal
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .exponent:
            return nil
        }
    }
}
