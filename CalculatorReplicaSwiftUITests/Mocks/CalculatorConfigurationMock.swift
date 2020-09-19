//
//  CalculatorConfigurationMock.swift
//  CalculatorReplicaSwiftUITests
//
//  Created by Alonso on 4/25/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
@testable import Calculator

struct CalculatorConfigurationMock: CalculatorConfigurationProtocol {
    var calculatorDisplayMaxLimit: Int {
        return 9
    }
}
