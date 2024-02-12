//
//  SheetManageableTests.swift
//  
//
//  Created by James Sedlacek on 12/16/23.
//

import XCTest
import SwiftUI
@testable import Presenting

final class SheetManageableTests: XCTestCase {
    private var presenter: Presenter<MockRoute>!

    override func setUp() {
        super.setUp()
        presenter = .init()
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }

    func testPresentSheet() {
        presenter.presentSheet(.settings)
        XCTAssertNotNil(presenter.sheet)
    }

    func testDismissSheet() {
        presenter.presentSheet(.settings)
        presenter.dismissSheet()
        XCTAssertNil(presenter.sheet)
    }
    
    func testOnDismiss() {
        var didCallOnDismiss = false
        presenter.presentSheet(.settings) {
            didCallOnDismiss = true
        }
        presenter.onDismiss?()
        XCTAssertTrue(didCallOnDismiss)
    }
}

fileprivate enum MockRoute: Presentable {
    case settings

    var id: UUID { .init() }

    var body: some View {
        switch self {
        case .settings:
            MockSettingsView()
        }
    }
}

fileprivate struct MockSettingsView: View {
    var body: some View {
        Text("Mock Settings View")
    }
}
