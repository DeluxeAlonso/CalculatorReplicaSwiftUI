//
//  CalculatorButtonView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorButtonView: View {
    @EnvironmentObject var env: CalculatorEnvironmentObject
    
    let button: CalculatorButtonProtocol
    
    var body: some View {
        Button(action: {
            self.env.handleCalculatorButton(identifier: self.button.identifier)
        }, label: {
            containedView()
        })
        .accessibility(label: Text(button.accessibilityLabel))
    }
    
    private func containedView() -> AnyView {
        if let iconName = button.icon {
            return CalculatorImageButtonLegacy(imageName: iconName, style: button.style).erasedToAnyView()
        } else {
            return CalculatorTextButtonLegacy(text: button.title, style: button.style).erasedToAnyView()
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    let style: CalculatorButtonStyleProtocol

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .calculatorButtonStyle(for: style)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
    
    // MARK: - Constants

    struct Constant {
        static let spacing = 12
        static let numberOfButtonsPerRow = 4
    }
}
