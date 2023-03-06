//
//  CalculatorTextButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 5/1/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorTextButton: View {
    let button: CalculatorButtonProtocol
    
    var body: some View {
        Text(button.title)
            .font(.system(size: 32.0))
            .calculatorButtonStyle(for: button)
    }
}
