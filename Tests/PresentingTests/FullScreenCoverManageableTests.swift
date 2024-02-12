//
//  FullScreenCoverManageableTests.swift
//  
//
//  Created by James Sedlacek on 12/16/23.
//

import XCTest
import SwiftUI
@testable import Presenting

final class FullScreenCoverManageableTests: XCTestCase {
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
        presenter.presentFullScreenCover(.settings)
        XCTAssertNotNil(presenter.fullScreenCover)
    }

    func testDismissSheet() {
        presenter.presentFullScreenCover(.settings)
        presenter.dismissFullScreenCover()
        XCTAssertNil(presenter.fullScreenCover)
    }
    
    func testOnDismiss() {
        var didCallOnDismiss = false
        presenter.presentFullScreenCover(.settings) {
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
