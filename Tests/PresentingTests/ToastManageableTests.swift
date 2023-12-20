//
//  ToastManageableTests.swift
//  
//
//  Created by James Sedlacek on 12/18/23.
//

import XCTest
import SwiftUI
@testable import Presenting

final class ToastManageableTests: XCTestCase {
    private var presenter: MockToastManager!

    override func setUp() {
        super.setUp()
        presenter = .init()
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }

    func testPresentToast() {
        let toast = Toast.info(message: "Test message")
        presenter.presentToast(toast)
        XCTAssertNotNil(presenter.toastConfig)
    }

    func testDismissToast() {
        let toast = Toast.info(message: "Test message")
        presenter.presentToast(toast)
        presenter.dismissToast()
        XCTAssertNil(presenter.toastConfig)
    }
}

fileprivate class MockToastManager: ToastManageable {
    @Published var toastConfig: ToastConfiguration?
}
