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
        switch button.contentType {
        case .icon(let iconName):
            return CalculatorImageButton(imageName: iconName, style: button.style).erasedToAnyView()
        case .title(let title):
            return CalculatorTextButton(text: title, style: button.style).erasedToAnyView()
        }
    }
}
