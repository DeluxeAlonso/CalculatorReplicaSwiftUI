//
//  ContentView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/10/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let calculatorButtons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .dot, .equals]
    ]
    
    var buttonSize: (width: CGFloat, height: CGFloat) {
        guard let numberOfButtonsPerRow = calculatorButtons.first?.count else {
            return (.zero, .zero)
        }
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - CGFloat((numberOfButtonsPerRow + 1) * 12)) / CGFloat(numberOfButtonsPerRow)
        return (width, width)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Text("42")
                    .font(.system(size: 64))
                    .foregroundColor(.white)
                }.padding()
                
                ForEach(calculatorButtons, id: \.self) { buttons in
                    HStack(spacing: 12) {
                        ForEach(buttons, id: \.self) { button in
                            Text(button.title)
                                .font(.system(size: 32.0))
                                .frame(width: self.buttonSize.width, height: self.buttonSize.height)
                                .foregroundColor(.white)
                                .background(button.backgroundColor)
                                .cornerRadius(self.buttonSize.width / 2)
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
