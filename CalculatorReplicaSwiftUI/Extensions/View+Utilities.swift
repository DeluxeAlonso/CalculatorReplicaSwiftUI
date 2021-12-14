//
//  View+Utilities.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 14/12/21.
//  Copyright © 2021 Alonso. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
