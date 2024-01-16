//
//  ConfirmationDialogManageableTests.swift
//
//
//  Created by Giorgio Latour on 1/15/24.
//

import SwiftUI
import XCTest
@testable import Presenting

final class ConfirmationDialogManageableTests: XCTestCase {
    private var presenter: MockConfirmationDialogManager!

    override func setUp() {
        super.setUp()
        presenter = MockConfirmationDialogManager()
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }

    func testPresentConfirmationDialog() {
        let confirmationDialog = ConfirmationDialog(Text("Test1")) {
            Button("TestButton") { }
        }
        presenter.presentConfirmationDialog(confirmationDialog)
        XCTAssertNotNil(presenter.confirmationDialog)
    }

    func testPresentConfirmationDialogWithMessage() {
        let confirmationDialog = ConfirmationDialog(Text("Test2")) {
            Button("TestButton") { }
        } message: {
            Text("TestMessage")
        }
        presenter.presentConfirmationDialog(confirmationDialog)
        XCTAssertNotNil(presenter.confirmationDialog)
    }

    func testPresentConfirmationDialogWithData() {
        let mockData: MockData? = MockData()
        let confirmationDialog = ConfirmationDialog(
            Text("Test3"), titleVisibility: .automatic, presenting: mockData) { mockData in
                Button("\(mockData.buttonTitle)") { }
            } message: { mockData in
                Text("\(mockData.message)")
            }
        presenter.presentConfirmationDialog(confirmationDialog)
        XCTAssertNotNil(presenter.confirmationDialog)
    }

    func testPresentConfirmationDialogWithEmptyData() {
        let mockData: MockData? = nil
        let confirmationDialog = ConfirmationDialog(
            Text("Test3"), titleVisibility: .automatic, presenting: mockData) { mockData in
                Button("\(mockData.buttonTitle)") { }
            } message: { mockData in
                Text("\(mockData.message)")
            }
        presenter.presentConfirmationDialog(confirmationDialog)
        XCTAssertNotNil(presenter.confirmationDialog)
    }

    func testDismissConfirmationDialog() {
        let confirmationDialog = ConfirmationDialog(Text("Test1")) {
            Button("TestButton") { }
        }
        presenter.presentConfirmationDialog(confirmationDialog)
        presenter.dismissConfirmationDialog()
        XCTAssertNil(presenter.confirmationDialog)
    }
}

fileprivate class MockConfirmationDialogManager: ConfirmationDialogManageable {
    @Published var confirmationDialog: ConfirmationDialog?
}

fileprivate struct MockData {
    let buttonTitle = "Button1"
    let message = "Message"
}
