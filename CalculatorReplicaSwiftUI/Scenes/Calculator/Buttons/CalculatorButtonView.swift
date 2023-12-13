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
        .buttonStyle(MyButtonStyle(style: button.style))
    }
    
    private func containedView() -> AnyView {
        if let iconName = button.icon {
            return CalculatorImageButton(imageName: iconName, style: button.style).erasedToAnyView()
        } else {
            return CalculatorTextButton(text: button.title, style: button.style).erasedToAnyView()
        }
    }
}

struct MyButtonStyle: ButtonStyle {
    let style: CalculatorButtonStyleProtocol

    private var buttonSize: (width: CGFloat, height: CGFloat) {
        let numberOfButtonsPerRow = Constant.numberOfButtonsPerRow
        let screenWidth = UIScreen.main.bounds.width
        let offset = style.gridSpace - 1

        let height = (screenWidth - CGFloat((numberOfButtonsPerRow + 1) * Constant.spacing)) / CGFloat(numberOfButtonsPerRow)
        let width = height * CGFloat(style.gridSpace) + CGFloat(Constant.spacing * offset)

        return (width, height)
    }

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
