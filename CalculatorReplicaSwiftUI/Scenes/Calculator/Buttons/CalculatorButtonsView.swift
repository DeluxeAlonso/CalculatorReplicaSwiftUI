//
//  CalculatorButtonsView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorButtonsView: View {
    @EnvironmentObject var env: CalculatorEnvironmentObject
    
    var body: some View {
        ForEach(0...env.calculatorButtons.count - 1, id: \.self) { index in
            HStack(spacing: 12) {
                ForEach(self.env.calculatorButtons[index], id: \.title) { button in
                    CalculatorButtonView(button: button)
                }
            }
        }
    }
}
