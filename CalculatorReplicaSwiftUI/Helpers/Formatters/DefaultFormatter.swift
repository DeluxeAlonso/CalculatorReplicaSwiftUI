//
//  DefaultFormatter.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/20/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class DefaultFormatter: NumberFormatter {
    override init() {
        super.init()
        numberStyle = .none
        maximumFractionDigits = Constants.defaultMaximumFractionDigits
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DefaultFormatter {
    struct Constants {
        static let defaultMaximumFractionDigits = 100
    }
}
