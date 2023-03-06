//
//  CalculatorResultDisplayView.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorResultDisplayView: View {
    @EnvironmentObject var env: CalculatorEnvironmentObject

    @State var isUserDragging: Bool = false
    
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
                .onChanged { gestureValue in
                    if !isUserDragging {
                        isUserDragging = true
                        handleUserDragGesture(gestureValue)
                    }
                }
                .onEnded { _ in
                    isUserDragging = false
                }
        )
        .padding()
    }

    // MARK: - Private

    private func handleUserDragGesture(_ value: DragGesture.Value) {
        if value.isHorizontalDrag(toleranceOffset: 10.0) {
            env.deleteLastSingleDigit()
        }
    }
}
