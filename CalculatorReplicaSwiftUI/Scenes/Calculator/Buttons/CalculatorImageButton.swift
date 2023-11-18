//
//  CalculatorImageButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 5/1/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorImageButton: View {
    let imageName: String
    let style: CalculatorButtonStyleProtocol
    
    var body: some View {
        Image(systemName: imageName)
            .font(.system(size: 25.0, weight: .medium))
            .calculatorButtonStyle(for: style)
    }
}
