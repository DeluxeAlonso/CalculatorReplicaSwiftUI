//
//  View+Modifiers.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 5/3/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

extension View {
    func calculatorButtonStyle(for button: CalculatorOptionProtocol) -> some View {
        self.modifier(CalculatorButtonViewModifier(button: button))
    }
}
