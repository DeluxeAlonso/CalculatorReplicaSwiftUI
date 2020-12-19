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

    @State var isUserSwipping: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(env.formattedCalculatorDisplay)
                    .font(.system(size: 72))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
            }
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged {
                    if !isUserSwipping {
                        if $0.isHorizontalDrag {
                            env.deleteLastSingleDigit()
                            print("Horizontal")
                        }
                        isUserSwipping = true
                    }
                }
                .onEnded { _ in
                    isUserSwipping = false
                }
        )
        .padding()
    }
}
