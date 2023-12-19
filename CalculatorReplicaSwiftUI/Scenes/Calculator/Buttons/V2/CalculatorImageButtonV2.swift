//
//  CalculatorImageButtonV2.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 19/12/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorImageButtonV2: View {
    @EnvironmentObject var env: CalculatorEnvironmentObject

    let identifier: String
    let imageName: String
    let style: CalculatorButtonStyleProtocol
    let accessibilityLabel: String
    
    var body: some View {
        Button(action: {
            self.env.handleCalculatorButton(identifier: identifier)
        }, label: {
            Image(systemName: imageName)
                .font(.system(size: 25.0, weight: .medium))
                .calculatorButtonStyle(for: style)
        })
        .accessibility(label: Text(accessibilityLabel))
    }
}
