//
//  URLModifier.swift
//
//  Created by Ibrahim Hamed on 13/01/2024.
//

import SwiftUI

/// Extension to open url at any View
/// - Parameters:
///   - config: The configuration for the URL.
///   - onCompletion: A closure that is called after the URL opening action is completed.
extension View {
    func openURL(config: URLConfiguration, onCompletion: @escaping () -> Void) -> some View {
        modifier(URLModifier(config: config, onCompletion: onCompletion))
    }
}

struct URLModifier: ViewModifier {
    @Environment(\.openURL) var openURL
    @State private var isInAppSafariPresented: Bool = false
    private let config: URLConfiguration
    private let onCompletion: () -> Void

    init(config: URLConfiguration, onCompletion: @escaping () -> Void) {
        self.config = config
        self.onCompletion = onCompletion
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                if let url = URL(string: config.urlString) {
                    switch config.urlOpeningType {
                    case .safari:
                        openURL(url)
                        clearURLConfig()
                    case .inAppBrowser:
                        isInAppSafariPresented = true
                    case .urlSchema:
                        UIApplication.shared.open(url)
                        clearURLConfig()
                    }
                }
            }
            .sheet(isPresented: $isInAppSafariPresented) {
                if let url = URL(string: config.urlString) {
                    SafariView(url: url)
                        .ignoresSafeArea(.all)
                        .onDisappear {
                            clearURLConfig()
                        }
                }
            }
    }

    private func clearURLConfig() {
        onCompletion()
    }
}
