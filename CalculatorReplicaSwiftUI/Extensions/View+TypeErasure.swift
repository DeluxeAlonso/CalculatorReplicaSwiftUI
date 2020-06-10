//
//  View+TypeErasure.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 6/9/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

extension View {
    func erasedToAnyView() -> AnyView {
        AnyView(self)
    }
}
