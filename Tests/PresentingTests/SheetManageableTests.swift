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
    private var presenter: MockSheetManager!

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
}

fileprivate class MockSheetManager: SheetManageable {
    typealias Destination = Route

    @Published var sheet: Route?

    enum Route: ViewDisplayable {
        case settings

        @ViewBuilder
        var viewToDisplay: some View {
            switch self {
            case .settings:
                MockSettingsView()
            }
        }
    }
}

fileprivate struct MockSettingsView: View {
    var body: some View {
        Text("Mock Settings View")
    }
}
