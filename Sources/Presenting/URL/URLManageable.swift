//
//  URLManageable.swift
//
//  Created by Ibrahim Hamed on 13/01/2024.
//

import Foundation

/// Protocol defining the requirements for an object to manage URL operations.
public protocol URLManageable: ObservableObject {
    /// Configuration for handling URLs. Stores details about how URLs should be opened.
    var urlConfig: URLConfiguration? { get set }

    /// Opens a URL based on a specified method.
    ///
    /// - Parameters:
    ///   - type: The method for opening the URL (`UrlOpeningType`).
    ///   - urlString: The URL string to be opened.
    func open(_ type: URLOpeningType, urlString: String)

    /// Clears the current URL configuration.
    func clearURLConfig()
}

public extension URLManageable {
    /// Opens a URL with a given opening type and URL string.
    /// Sets up the URL configuration (`urlConfig`) for later use.
    ///
    /// - Parameters:
    ///   - urlOpeningType: The method for opening the URL (`UrlOpeningType`).
    ///   - urlString: The URL string to be opened.
    func open(_ urlOpeningType: URLOpeningType, urlString: String) {
        urlConfig = .init(urlOpeningType: urlOpeningType, urlString: urlString)
    }

    /// Clears the current URL configuration (`urlConfig`).
    /// This function is useful for resetting or removing the URL configuration.
    func clearURLConfig() {
        urlConfig = nil
    }
}
