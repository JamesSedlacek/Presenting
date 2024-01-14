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
                    case .safari:
                        openURL(url)
                        resetURLConfig()
                    case .inAppBrowser:
                        isInAppBrowserPresented = true
                    case .urlSchema:
                        openURLSchema(url)
                        resetURLConfig()
                    }
                }
            }
        
            .sheet(isPresented: $isInAppBrowserPresented, onDismiss: {
                resetURLConfig()
            }, content: {
                if let url = config?.url {
                    SafariView(url: url)
                        .ignoresSafeArea(.all)
                }
            })
    }

    private func resetURLConfig() {
        config = nil
    }
    
    private func openURLSchema(_ url: URL){
#if !os(macOS)
        UIApplication.shared.open(url)
#elseif os(macOS)
        NSWorkspace.shared.open(url)
#endif
    }
}
