//
//  CalculatorTextButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 7/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import SwiftUI

protocol CalculatorTextButtonProtocol {
    var identifier: String { get }
    var title: String { get }
    var accessibilityLabel: String { get }
    var style: CalculatorButtonStyleProtocol { get }
}

struct CalculatorTextButton: View {
    @EnvironmentObject var env: CalculatorEnvironmentObject

    let button: CalculatorTextButtonProtocol

    var body: some View {
        Button(action: {
            env.handleCalculatorButton(identifier: self.button.identifier)
        }, label: {
            Text(button.title)
                .font(.system(size: 32.0))
                .calculatorButtonStyle(for: button.style)
        })
        .accessibility(label: Text(button.accessibilityLabel))
    }
}
//
//struct CalculatorTextButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorTextButton(button: CalculatorButton(representable: .eight))
//    }
//}
