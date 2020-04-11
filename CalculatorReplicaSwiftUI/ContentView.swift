//
//  ContentView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/10/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let calculatorButtons = [
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", ".", "="]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Text("42")
                    .font(.system(size: 64))
                    .foregroundColor(.white)
                }.padding()
                
                ForEach(calculatorButtons, id: \.self) { buttons in
                    HStack {
                        ForEach(buttons, id: \.self) { buttonText in
                            Text(buttonText)
                                .font(.system(size: 32.0))
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
