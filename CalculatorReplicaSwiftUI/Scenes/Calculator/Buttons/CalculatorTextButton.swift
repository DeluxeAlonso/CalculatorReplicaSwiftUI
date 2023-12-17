//
//  CalculatorTextButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 5/1/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorTextButton: View {
    let text: String
    let style: CalculatorButtonStyleProtocol
    
    var body: some View {
        Text(text)
            .font(.system(size: 32.0))
            .calculatorButtonStyle(for: style)
    }
}
