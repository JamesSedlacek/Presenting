//
//  URLManageableTests.swift
//
//  Created by Ibrahim Hamed on 13/01/2024.
//

import XCTest
@testable import Presenting

final class URLManageableTests: XCTestCase {
    private var presenter: MockURLManager!
    
    override func setUp() {
        super.setUp()
        presenter = .init()
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func testOpenURL(){
        presenter.open(.inAppBrowser, urlString: "https://www.google.com")
        XCTAssertNotNil(presenter.urlConfig)
    }
    
    func testClearURLConfig(){
        presenter.open(.inAppBrowser, urlString: "https://www.google.com")
        presenter.clearURLConfig()
        XCTAssertNil(presenter.urlConfig)
    }
    
}

fileprivate class MockURLManager: URLManageable {
    @Published var urlConfig: URLConfiguration?
}
