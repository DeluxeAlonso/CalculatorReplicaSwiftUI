//
//  CalculatorResultDisplayViewTests.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 13/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

@testable import Calculator
import SnapshotTesting
import SwiftUI
import XCTest

final class CalculatorResultDisplayViewTests: XCTestCase {

    func testResultDisplayView() {
        let calculatorEnvironmentObject = DependencyInjectionFactory.createCalculatorEnvironmentObject()
        calculatorEnvironmentObject.formattedCalculatorDisplay = "1"

        let view = CalculatorResultDisplayView()
            .environmentObject(calculatorEnvironmentObject)
            .background(Color.black)
            .previewLayout(.fixed(width: 200, height: 80))
        assertSnapshot(of: view, as: .image, record: true)
    }

}
