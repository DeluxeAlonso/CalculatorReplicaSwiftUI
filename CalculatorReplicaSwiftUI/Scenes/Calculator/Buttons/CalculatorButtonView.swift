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
    }
    
    private func containedView() -> AnyView {
        if case let .icon(iconName) = button.contentType {
            return CalculatorImageButton(imageName: iconName, style: button.style).erasedToAnyView()
        } else {
            return CalculatorTextButton(button: button).erasedToAnyView()
        }
    }
}
