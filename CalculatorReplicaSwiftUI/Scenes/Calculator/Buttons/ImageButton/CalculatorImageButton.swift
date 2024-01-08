//
//  CalculatorImageButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 7/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorImageButton: View {
    @EnvironmentObject var env: CalculatorEnvironmentObject

    let button: CalculatorImageButtonProtocol

    var body: some View {
        Button(action: {
            env.handleCalculatorButton(identifier: button.identifier)
        }, label: {
            Image(systemName: button.imageName)
                .font(.system(size: 25.0, weight: .medium))
                .calculatorButtonStyle(for: button.style)
        })
        .accessibility(label: Text(button.accessibilityLabel))
    }
}

//struct CalculatorImageButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorImageButton()
//    }
//}
