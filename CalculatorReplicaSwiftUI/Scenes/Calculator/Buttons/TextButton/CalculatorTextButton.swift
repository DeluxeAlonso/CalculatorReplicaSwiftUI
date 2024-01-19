//
//  CalculatorTextButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 7/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorTextButton: View {
    @EnvironmentObject var env: CalculatorEnvironmentObject

    let button: CalculatorTextButtonProtocol

    var body: some View {
        Button(action: {
            env.handleCalculatorButton(identifier: button.identifier)
        }, label: {
            Text(button.text)
                .font(.system(size: 32.0))
                .calculatorButtonStyle(for: button.style)
        })
        .accessibilityIdentifier(button.identifier)
        .accessibility(label: Text(button.accessibilityLabel))
    }
}

struct CalculatorTextButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorTextButton(button: CalculatorTextButtonAdapter(CalculatorButton(representable: .eight)))
                .previewDisplayName("Compact grid space")

            CalculatorTextButton(button: CalculatorTextButtonAdapter(CalculatorButton(representable: .eight, gridSpace: 2)))
                .previewDisplayName("Expanded grid space")
        }
    }
}
