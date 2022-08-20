//
//  SaveView.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 20/08/2022.
//

import Foundation
import SwiftUI

// Extension for rendering View into the UIImage
// Using snapshot function we can render CanvasView into UIImage and use this image in MNIST model

extension View {
    
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
