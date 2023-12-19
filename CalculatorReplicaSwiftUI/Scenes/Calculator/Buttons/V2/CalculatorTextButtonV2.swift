//
//  CalculatorTextButtonV2.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 19/12/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorTextButtonV2: View {
    @EnvironmentObject var env: CalculatorEnvironmentObject

    let identifier: String
    let text: String
    let style: CalculatorButtonStyleProtocol
    let accessibilityLabel: String

    var body: some View {
        Button(action: {
            self.env.handleCalculatorButton(identifier: identifier)
        }, label: {
            Text(text)
                .font(.system(size: 32.0))
                .calculatorButtonStyle(for: style)
        })
        .accessibility(label: Text(accessibilityLabel))
    }
}
