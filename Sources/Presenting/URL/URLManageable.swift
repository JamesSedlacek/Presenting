//
//  URLManageable.swift
//
//  Created by Ibrahim Hamed on 13/01/2024.
//

#if !os(macOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

/// Protocol defining the requirements for an object to manage URL operations.
public protocol URLManageable: ObservableObject {
    /// Configuration for handling URLs. Stores details about how URLs should be opened.
    var urlConfig: URLConfiguration? { get set }

    /// Attempts to open a URL based on a specified `URLOpeningType` and a string.
    ///
    /// - Parameters:
    ///   - type: The method for opening the URL.
    ///   - using: The URL string to open.
    ///
    /// - Throws: An error if the URL is invalid or cannot be opened as specified.
    func openUrl(_ type: URLOpeningType, using urlString: String) throws
}

public extension URLManageable {
    /// Attempts to open a URL based on a specified `URLOpeningType` and a string.
    /// Sets up the URL configuration (`urlConfig`) for later use.
    ///
    /// - Parameters:
    ///   - type: The method for opening the URL.
    ///   - using: The URL string to open.
    ///
    /// - Throws: An error if the URL is invalid or cannot be opened as specified.
    func openUrl(_ urlOpeningType: URLOpeningType, using urlString: String) throws {
#if !os(macOS)
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else {
            throw URLOpeningError.invalidURL("The URL provided is not valid.")
        }
#elseif os(macOS)
        guard let url = URL(string: urlString), NSWorkspace.shared.open(url) else {
            throw URLOpeningError.invalidURL("The URL provided is not valid.")
        }
#endif

        urlConfig = .init(type: urlOpeningType, url: url)
    }
}
