//
//  BrowserView.swift
//
//  Created by Ibrahim Hamed on 13/01/2024.
//
#if !os(macOS)
import SafariServices
#elseif os(macOS)
import WebKit
#endif
import SwiftUI

struct BrowserView {
    let url: URL
}

#if !os(macOS)
extension BrowserView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

#elseif os(macOS)
extension BrowserView: NSViewRepresentable {

    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        nsView.load(request)
    }
}
#endif

