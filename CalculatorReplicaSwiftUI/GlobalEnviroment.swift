//
//  GlobalEnviroment.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Combine

class GlobalEnviroment: ObservableObject {
    @Published var calculatorDisplay: String = ""
    
    func updateCalculatorDisplay(calculatorButton: CalculatorButton) {
        calculatorDisplay = calculatorButton.title
    }
}
