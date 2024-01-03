//
//  ShareSheet+Extension.swift
//  Mini Browser
//
//  Created by Rayan Khan on 1/3/24.
//

import SwiftUI

//MARK: SwiftUI for iOS 13.0 - 15.x did not include a antive way to present the ShareSheet. This is a workaround to call the ShareSheet in SwiftUI.

struct ShareSheet: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {
    }
}
