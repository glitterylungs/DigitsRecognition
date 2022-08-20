//
//  CanvasViewModel.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 20/08/2022.
//

import Foundation
import SwiftUI

extension CanvasView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var currentLine = Line()
        
        func addNewPoint(_ value: DragGesture.Value) {
            let newPoint = value.location
            currentLine.points.append(newPoint)
        }
        
        func removePoints() {
            currentLine = Line(points: [])
        }
    }
}
