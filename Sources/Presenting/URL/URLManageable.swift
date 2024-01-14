//
//  URLManageable.swift
//
//  Created by Ibrahim Hamed on 13/01/2024.
//

import UIKit

/// Protocol defining the requirements for an object to manage URL operations.
public protocol URLManageable: ObservableObject {
    /// Configuration for handling URLs. Stores details about how URLs should be opened.
    var urlConfig: URLConfiguration? { get set }

    /// Opens a URL based on a specified method.
    ///
    /// - Parameters:
    ///   - type: The method for opening the URL (`UrlOpeningType`).
    ///   - urlString: The URL string to be opened.
    ///
    /// - Throws: Error if the URL is invalid
    func open(_ type: URLOpeningType, urlString: String) throws
}

public extension URLManageable {
    /// Opens a URL with a given opening type and URL string.
    /// Sets up the URL configuration (`urlConfig`) for later use.
    ///
    /// - Parameters:
    ///   - urlOpeningType: The method for opening the URL (`UrlOpeningType`).
    ///   - urlString: The URL string to be opened.
    ///
    /// - Throws: Error if the URL is invalid
    func open(_ urlOpeningType: URLOpeningType, urlString: String) throws {
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else {
            throw URLOpeningError.invalidURL("The URL provided is not valid.")
        }
        
        urlConfig = .init(type: urlOpeningType, url: url)
    }
}
