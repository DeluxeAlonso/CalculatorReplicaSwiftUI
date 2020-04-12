//
//  CalculatorButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorButton: View {
    @EnvironmentObject var env: GlobalEnviroment
    
    let button: CalculatorOptionProtocol
    
    var buttonSize: (width: CGFloat, height: CGFloat) {
        guard let numberOfButtonsPerRow = env.numberOfButtonsPerRow else { return (.zero, .zero) }
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - CGFloat((numberOfButtonsPerRow + 1) * 12)) / CGFloat(numberOfButtonsPerRow)
        return (width, width)
    }
    
    var body: some View {
        Button(action: {
            self.env.updateCalculatorDisplay(calculatorOption: self.button)
        }, label: {
            Text(button.title)
            .font(.system(size: 32.0))
            .frame(width: self.buttonSize.width, height: self.buttonSize.height)
            .foregroundColor(.white)
            .background(button.backgroundColor)
            .cornerRadius(self.buttonSize.width / 2)
        })
    }
}
