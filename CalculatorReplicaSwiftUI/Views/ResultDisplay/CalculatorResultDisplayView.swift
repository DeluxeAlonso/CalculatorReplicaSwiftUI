//
//  CalculatorResultDisplayView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorResultDisplayView: View {
    @EnvironmentObject var env: CalculatorEnviromentObject
    
    var body: some View {
        HStack {
            Spacer()
            Text(env.formattedCalculatorDisplay)
                .font(.system(size: 72))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
        }.padding()
    }
}
