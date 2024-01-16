//
//  SnapshotTestCase.swift
//  CalculatorReplicaSwiftUISnapshotTests
//
//  Created by Alonso on 13/01/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import SnapshotTesting
import SwiftUI
import XCTest

class SnapshotTestCase: XCTestCase {

    private var shouldRecord: Bool {
        ProcessInfo.processInfo.environment["SNAPSHOTS_RECORD"] != nil
    }

    func assertSnapshotImage(of view: some View,
                             file: StaticString = #file,
                             testName: String = #function,
                             line: UInt = #line) {
        assertSnapshot(of: view, as: .image, record: shouldRecord, file: file, testName: testName, line: line)
    }

}
