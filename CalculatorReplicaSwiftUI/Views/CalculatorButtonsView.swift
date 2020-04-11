//
//  CalculatorButtonsView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorButtonsView: View {
    @EnvironmentObject var env: GlobalEnviroment
    
    var body: some View {
        ForEach(env.calculatorButtons, id: \.self) { buttons in
            HStack(spacing: 12) {
                ForEach(buttons, id: \.self) { button in
                    CalculatorButton(button: button)
                }
            }
        }
    }
}
