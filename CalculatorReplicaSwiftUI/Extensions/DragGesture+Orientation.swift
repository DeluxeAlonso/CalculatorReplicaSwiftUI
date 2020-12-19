//
//  DragGesture+Orientation.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 12/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

extension DragGesture.Value {
    /**
     Indicates if the drag was a horizontal one.

     - Parameter toleranceOffset: Tolerance value to be used if the user drags in diagonal direction.

     - Returns: True is the drag gesture was in a horizontal way and false if not.
     */
    func isHorizontalDrag(toleranceOffset: CGFloat = 0.0) -> Bool {
        guard abs(startLocation.y - location.y) <= toleranceOffset else { return false }
        return startLocation.x > location.x || startLocation.x < location.x
    }
}
