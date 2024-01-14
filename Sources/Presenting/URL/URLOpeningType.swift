//
//  URLOpeningType.swift
//
//  Created by Ibrahim Hamed on 13/01/2024.
//

import Foundation

/// Enumerates the types of URL opening methods in an application.
public enum URLOpeningType {
    /// `safari`: Opens the URL in the Safari browser. This method takes the user out of the app to the default web browser on the device.
    case safari

    /// `inAppBrowser`: Opens the URL within the app using an in-app browser,.
    case inAppBrowser

    /// `urlSchema`: Handles custom URL schemes. Used for deep linking into other apps or for specific in-app actions based on custom URL patterns.
    case urlSchema
}

