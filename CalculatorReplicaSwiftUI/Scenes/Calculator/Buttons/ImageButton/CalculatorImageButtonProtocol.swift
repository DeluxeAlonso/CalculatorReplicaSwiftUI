//
//  CalculatorImageButtonProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 7/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

protocol CalculatorImageButtonProtocol {
    var identifier: String { get }
    var imageName: String { get }
    var accessibilityLabel: String { get }
    var style: CalculatorButtonStyleProtocol { get }
}
