//
//  CanvasView.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 17/08/2022.
//

import SwiftUI

struct CanvasView: View {
    
    @StateObject private var viewModel = ViewModel()
    @Binding var lines: [Line]

    var body: some View {

        Canvas { context, size in
            for line in lines {
                var path = Path()
                path.addLines(line.points)
                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
            }
        }.frame(width: C.canvasSize, height: C.canvasSize, alignment: .center)
            .background(.white)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                    viewModel.addNewPoint(value)
                    self.lines.append(viewModel.currentLine)
            })
                .onEnded({ value in
                    viewModel.removePoints()
                })
            )
    }
}


struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(lines: .constant([]))
    }
}
