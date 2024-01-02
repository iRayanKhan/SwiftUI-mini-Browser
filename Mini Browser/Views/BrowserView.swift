//
//  BrowserView.swift
//  Mini Browser
//
//  Created by Rayan Khan on 1/1/24.
//

import SwiftUI

struct BrowserView: View {
    @StateObject private var viewModel = WebViewStateModel()

    private var webView: WebView {
        WebView(urlString: "https://wholelotta.red", viewModel: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            webView
            HStack {
                Button(action: goBack) {
                    Image(systemName: "arrow.backward")
                }
                .disabled(!viewModel.canGoBack)

                Button(action: goForward) {
                    Image(systemName: "arrow.forward")
                }
                .disabled(!viewModel.canGoForward)

                Button(action: reload) {
                    Image(systemName: "arrow.clockwise")
                }
            }.padding(.horizontal)
        }
    }

    func goBack() {
        viewModel.webView.goBack()
    }

    func goForward() {
        viewModel.webView.goForward()
    }

    func reload() {
        viewModel.webView.reload()
    }
}



#Preview {
    BrowserView()
}
