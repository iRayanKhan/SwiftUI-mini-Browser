//
//  WebStateViewModel.swift
//  Mini Browser
//
//  Created by Rayan Khan on 1/1/24.
//

import Foundation
import WebKit

class WebViewStateModel: NSObject, ObservableObject, WKNavigationDelegate {
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    @Published var currentURL: URL?

    var webView: WKWebView = WKWebView()

    override init() {
        super.init()
        self.webView.navigationDelegate = self
        setUserAgent()
    }

    private func setUserAgent() {
        webView.customUserAgent = "00p1um Mini Browser"
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        canGoBack = webView.canGoBack
        canGoForward = webView.canGoForward
        currentURL = webView.url
    }
}

