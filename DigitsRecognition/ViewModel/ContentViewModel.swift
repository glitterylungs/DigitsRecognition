//
//  ContentViewModel.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 20/08/2022.
//

import Foundation
import SwiftUI
import Vision
import CoreML

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var lines: [Line] = []
        @Published var classificationLabel: String = ""
        
        func clearCanvas() {
            lines = []
        }
        
        
        func classifyImage(image: UIImage) {
            
            // Use function from Model/PrepareImage.swift
            let resizedImage = image.imageResized(to: CGSize(width: 28, height: 28))
            
            // Create CIImage from UIImage
            guard let ciImage = CIImage(image: resizedImage) else {
                fatalError("Couldn't convert UIImage to CIImage")
            }
            
            // Loading model
            guard let mnistModel = try? VNCoreMLModel(for: MNISTClassifier(configuration: .init()).model) else {
                fatalError("Loading CoreML model failed")
            }
            
            // Model request
            let request = VNCoreMLRequest(model: mnistModel) { request, error in
                guard let results = request.results as? [VNClassificationObservation] else {
                    fatalError("Failed to process image")
                }
                print(results.first?.identifier ?? "10")
            }
            
            // Passing image to the model
            let handler = VNImageRequestHandler(ciImage: ciImage)
            
            do {
                try handler.perform([request])
            }
            catch {
                print(error)
            }
        }
    }
}
