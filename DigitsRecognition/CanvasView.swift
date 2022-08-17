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
    
    private let gradient = LinearGradient(colors: [Color("gradientOne"), Color("gradientTwo")], startPoint: .trailing, endPoint: .leading)
    

    var body: some View {

        Canvas { context, size in
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Drawing Code@*/ /*@END_MENU_TOKEN@*/
        }.frame(width: canvasSize, height: canvasSize, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(gradient, lineWidth: 8))
            .background(.white)
        
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
