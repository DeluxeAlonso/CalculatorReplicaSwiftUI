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
            self.env.handleCalculatorButton(self.button)
        }, label: {
            containedView()
        })
        .accessibility(label: Text(button.accessibilityLabel))
        .buttonStyle(CustomButtonStyle(style: button.style))
    }
    
    private func containedView() -> AnyView {
        if let iconName = button.icon {
            return CalculatorImageButton(imageName: iconName, style: button.style).erasedToAnyView()
        } else {
            return CalculatorTextButton(text: button.title, style: button.style).erasedToAnyView()
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
