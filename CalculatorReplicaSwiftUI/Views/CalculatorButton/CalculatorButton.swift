//
//  CalculatorButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorButton: View {
    @EnvironmentObject var env: CalculatorEnviromentObject
    
    let button: CalculatorOptionProtocol
    
    var body: some View {
        Button(action: {
            self.env.handleCalculatorOption(self.button)
        }, label: {
            containedView()
        })
    }
    
    func containedView() -> AnyView {
        if let _ = button.icon {
            return AnyView(CalculatorImageButton(button: button))
        } else {
            return AnyView(CalculatorTextButton(button: button))
        }
    }
}
