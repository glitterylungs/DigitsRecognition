//
//  PrepareImage.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 20/08/2022.
//

import Foundation
import UIKit

extension UIImage {
    
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

