//
//  URLOpeningError.swift
//
//  Created by Ibrahim Hamed on 14/01/2024.
//

import Foundation

/// `URLOpeningError` is an enum representing errors in URL processing.
enum URLOpeningError: Error {
    /// `invalidURL(String)`: Indicates an invalid URL with the erroneous URL string provided.
    case invalidURL(String)
}
