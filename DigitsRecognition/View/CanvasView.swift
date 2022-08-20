//
//  CanvasView.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 17/08/2022.
//

import SwiftUI

struct CanvasView: View {
    
    @State private var currentLine = Line()
    @Binding var lines: [Line]
    
    private let canvasSize = UIScreen.main.bounds.width - 60

    var body: some View {

        Canvas { context, size in
            
            for line in lines {
                var path = Path()
                path.addLines(line.points)
                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
            }
        }.frame(width: canvasSize, height: canvasSize, alignment: .center)
            .background(.white)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                    let newPoint = value.location
                    currentLine.points.append(newPoint)
                    self.lines.append(currentLine)
            })
                .onEnded({ value in
                    self.currentLine = Line(points: [])
                })
            )
    }
}



struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(lines: .constant([]))
    }
}
