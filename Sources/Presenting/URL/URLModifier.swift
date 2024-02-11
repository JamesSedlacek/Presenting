//
//  URLModifier.swift
//
//  Created by Ibrahim Hamed on 13/01/2024.
//

import SwiftUI

/// Extension to open url at any View
/// - Parameters:
///   - config: The configuration for the URL.
extension View {
    func openURL(config: Binding<URLConfiguration?>) -> some View {
        modifier(URLModifier(config: config))
    }
}

struct URLModifier: ViewModifier {
    @Environment(\.openURL) var openURL
    @State private var isInAppBrowserPresented: Bool = false
    @Binding var config: URLConfiguration?

    init(config: Binding<URLConfiguration?>) {
        self._config = config
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                if let url = config?.url, let type = config?.type  {
                    switch type {
                    case .inBrowser:
                        openURL(url)
                        resetURLConfig()
                    case .inApp:
                        isInAppBrowserPresented = true
                    }
                }
            }
        
            .sheet(
                isPresented: $isInAppBrowserPresented,
                onDismiss: resetURLConfig,
                content: {
                    if let url = config?.url {
                        BrowserView(url: url)
                            .ignoresSafeArea(.all)
                    }
                }
            )
    }

    private func resetURLConfig() {
        config = nil
    }
}
