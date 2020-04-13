//
//  CalculatorOptionProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

protocol CalculatorOptionProtocol {
    var title: String { get set }
    var gridSpace: Int { get set }
    var backgroundColor: Color { get set }
    var operation: CalculatorOperation? { get set }
    
    var isPlainNumber: Bool { get }
    var shouldShowOnResultDisplay: Bool { get }
}
