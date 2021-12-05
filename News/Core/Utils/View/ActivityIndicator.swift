//
//  ActivityIndicator.swift
//  News
//
//  Created by Agung Tri Utomo on 02/12/21.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(
        context: UIViewRepresentableContext<ActivityIndicator>
    ) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    func updateUIView(
        _ uiView: UIActivityIndicatorView,
        context: UIViewRepresentableContext<ActivityIndicator>
    ) {
        uiView.startAnimating()
    }
}
