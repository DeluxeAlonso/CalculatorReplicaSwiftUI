//
//  ContentView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/10/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var env: GlobalEnviroment
    
    private let calculatorButtons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .dot, .equals]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Text(env.calculatorDisplay)
                    .font(.system(size: 64))
                    .foregroundColor(.white)
                }.padding()
                
                ForEach(calculatorButtons, id: \.self) { buttons in
                    HStack(spacing: 12) {
                        ForEach(buttons, id: \.self) { button in
                            
                            CalculatorButtonsView(button: button).environmentObject(self.env)
                            
                        }
                    }
                    
                }
            }.padding(.bottom)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnviroment())
    }
}
