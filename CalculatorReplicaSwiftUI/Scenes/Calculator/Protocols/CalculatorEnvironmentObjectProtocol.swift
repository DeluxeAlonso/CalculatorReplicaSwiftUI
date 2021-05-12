//
//  CalculatorEnvironmentObjectProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Combine

protocol CalculatorEnvironmentObjectProtocol: AnyObject {
    func updateValue(_ value: String, isEnteringNumbers: Bool)
}
