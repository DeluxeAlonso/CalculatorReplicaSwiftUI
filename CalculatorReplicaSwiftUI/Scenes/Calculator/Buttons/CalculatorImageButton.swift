//
//  CalculatorImageButton.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 5/1/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

struct CalculatorImageButton: View {
    let button: CalculatorButtonProtocol
    
    var body: some View {
        Image(systemName: button.icon!)
            .font(.system(size: 25.0, weight: .medium))
            .calculatorButtonStyle(for: button)
    }
}
