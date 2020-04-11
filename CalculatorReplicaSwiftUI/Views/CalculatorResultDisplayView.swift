//
//  CalculatorResultDisplayView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorResultDisplayView: View {
    @EnvironmentObject var env: GlobalEnviroment
    
    var body: some View {
        HStack {
            Spacer()
            Text(env.calculatorDisplay)
            .font(.system(size: 64))
            .foregroundColor(.white)
        }.padding()
    }
}
