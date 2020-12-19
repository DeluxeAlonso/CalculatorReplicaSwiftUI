//
//  DragGesture+Orientation.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 12/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

extension DragGesture.Value {

    var isHorizontalDrag: Bool {
        if startLocation.x > location.x || startLocation.x < location.x {
            return true
        } else {
            return false
        }
    }

}
