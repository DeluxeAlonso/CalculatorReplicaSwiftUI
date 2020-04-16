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
    
    var body: some View {
        Button(action: {
            self.env.handleCalculatorOption(self.button)
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

// MARK: - Button size

extension CalculatorButton {
    var buttonSize: (width: CGFloat, height: CGFloat) {
        guard let numberOfButtonsPerRow = env.numberOfButtonsPerRow else { return (.zero, .zero) }
        let screenWidth = UIScreen.main.bounds.width
        let offset = button.gridSpace - 1
        
        let height = (screenWidth - CGFloat((numberOfButtonsPerRow + 1) * Constant.spacing)) / CGFloat(numberOfButtonsPerRow)
        let width = height * CGFloat(button.gridSpace) + CGFloat(Constant.spacing * offset)
        
        return (width, height)
    }
}

// MARK: - Constants

extension CalculatorButton {
    struct Constant {
        static let spacing = 12
    }
}
