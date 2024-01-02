//
//  WebView.swift
//  Mini Browser
//
//  Created by Rayan Khan on 1/1/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String
    @ObservedObject var viewModel: WebViewStateModel

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: urlString) else {
            return WKWebView()
        }
        viewModel.webView.load(URLRequest(url: url))
        return viewModel.webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

