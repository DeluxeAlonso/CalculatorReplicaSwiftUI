//
//  DragGesture+Orientation.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 12/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

extension DragGesture.Value {
    func isHorizontalDrag(toleranceOffset: CGFloat = 0.0) -> Bool {
        guard abs(startLocation.y - location.y) <= toleranceOffset else { return false }
        return startLocation.x > location.x || startLocation.x < location.x
    }
}
