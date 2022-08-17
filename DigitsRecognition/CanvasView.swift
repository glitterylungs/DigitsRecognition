//
//  CanvasView.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 17/08/2022.
//

import SwiftUI

struct CanvasView: View {
    
    //@State private var lines = [CGPoint()]
    
    private let canvasSize = UIScreen.main.bounds.width - 60
    
    private let gradient = LinearGradient(
        gradient: Gradient(colors: [.red, .blue]),
        startPoint: .top,
        endPoint: .bottom)
    
    
    
    var body: some View {
        Canvas { context, size in
            context.draw(Text("lalal"), at: CGPoint(x: size.width / 2, y: size.height / 2))
            
        }.frame(width: canvasSize, height: canvasSize, alignment: .center)
            .border(.blue)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(gradient, lineWidth: 8))
//            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
//                let newPoint = value.location
//            }))
    }
}



struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
