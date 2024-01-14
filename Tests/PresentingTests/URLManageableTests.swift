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
    
    func testOpenURLWithValidURL(){
        do {
            try presenter.open(.inAppBrowser, urlString: "https://www.google.com")
        } catch {
            XCTFail("Error occurred: \(error)")
        }
        XCTAssertNotNil(presenter.urlConfig)
    }
    
    func testOpenURLWithInvalidURL() {
        let urlString = "invalid_url"
        XCTAssertThrowsError(try presenter.open(.safari, urlString: urlString))
    }
}

fileprivate class MockURLManager: URLManageable {
    @Published var urlConfig: URLConfiguration?
}
