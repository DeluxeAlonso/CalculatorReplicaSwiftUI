//
//  CalculatorButtonViewModifier.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 5/1/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorButtonViewModifier: ViewModifier {
    let button: CalculatorOptionProtocol
    
    private var buttonSize: (width: CGFloat, height: CGFloat) {
        let numberOfButtonsPerRow = Constant.numberOfButtonsPerRow
        let screenWidth = UIScreen.main.bounds.width
        let offset = button.gridSpace - 1
        
        let height = (screenWidth - CGFloat((numberOfButtonsPerRow + 1) * Constant.spacing)) / CGFloat(numberOfButtonsPerRow)
        let width = height * CGFloat(button.gridSpace) + CGFloat(Constant.spacing * offset)
        
        return (width, height)
    }

    var alignment: Alignment {
        return button.isPlainNumber ? .leading : .center
    }
    
    func body(content: Content) -> some View {
        content
            .if(button.isPlainNumber) { view in
                view.padding()
            }
            .frame(width: self.buttonSize.width, height: self.buttonSize.height, alignment: alignment)
            .foregroundColor(button.tintColor)
            .background(button.backgroundColor)
            .cornerRadius(self.buttonSize.width / 2)
    }
}

// MARK: - Constants

extension CalculatorButtonViewModifier {
    struct Constant {
        static let spacing = 12
        static let numberOfButtonsPerRow = 4
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
