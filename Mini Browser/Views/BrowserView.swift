//
//  BrowserView.swift
//  Mini Browser
//
//  Created by Rayan Khan on 1/1/24.
//

import SwiftUI

struct BrowserView: View {
    @StateObject private var viewModel = WebViewStateModel()
    @State private var showShareSheet = false
    
    private var webView: WebView {
        WebView(urlString: "https://wholelotta.red", viewModel: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            webView
            HStack {
                Button(action: goBack) {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 20, weight: .bold))
                }
                .disabled(!viewModel.canGoBack)
                
                Button(action: goForward) {
                    Image(systemName: "arrow.forward")
                        .font(.system(size: 20, weight: .bold))
                }
                .disabled(!viewModel.canGoForward)
                
                Button(action: reload) {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 20, weight: .bold))
                }
                
                Button(action: toggleShareSheet) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20, weight: .bold))
                }
            }.padding(.horizontal)
            VStack(alignment: .leading) {
                Text(viewModel.currentURL?.absoluteString ?? "")
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                    .padding(.horizontal)
            }
        }.sheet(isPresented: $showShareSheet) {
            ShareSheet(url: viewModel.currentURL!)
        }
    }
    
    func toggleShareSheet() {
        showShareSheet = true
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


