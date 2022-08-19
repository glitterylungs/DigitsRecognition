//
//  ContentView.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 16/08/2022.
//

import SwiftUI
import CoreML


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


struct ContentView: View {
    
    @State private var lines: [Line] = []
    @State private var classificationLabel: String = ""
    private let canvasSize = UIScreen.main.bounds.width - 20
    private let gradient = LinearGradient(colors: [Color("gradientOne"), Color("gradientTwo")], startPoint: .trailing, endPoint: .leading)
    
    let mnistModel = MNISTClassifier()
    
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "trashColor") as Any]
        }
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 80) {
                
                CanvasView(lines: $lines).cornerRadius(15).overlay(RoundedRectangle(cornerRadius: 15).stroke(gradient, lineWidth: 9))
                
                Button {
                    print("Predict tapped")
                    let image = CanvasView(lines: $lines).frame(width: canvasSize, height: canvasSize, alignment: .center).snapshot()
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    classifyImage(image: image)
  //                  print(classificationLabel)
                } label: {
                    Label("Predict", systemImage: "brain.head.profile")
                }.padding()
                .padding(.horizontal, 40)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(Color("textColor"))
                .background(Color("trashColor").cornerRadius(40).opacity(0.5).shadow(color: Color("textColor"), radius: 10))
                
                Spacer()
                
            }.padding(.top, 40)
            .navigationTitle("DigsReco")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Clear tapped")
                        lines = []
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(Color("trashColor"))
                    }
                }
            }
        }.navigationViewStyle(.stack)
    }
    
    private func classifyImage(image: UIImage) {
        let resizedImage = image.imageResized(to: CGSize(width: 280, height: 280))
        
        guard let buffer = resizedImage.convertToBuffer() else {
            fatalError("can't convert uiImage to CVPPixelBuffer")
        }
        UIImageWriteToSavedPhotosAlbum(resizedImage, nil, nil, nil)
        let result = try? mnistModel.prediction(image: buffer)
        print(result?.classLabel ?? 10)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
        }
    }
}




//Text("2")
//    .foregroundColor(Color("textColor"))
//    .font(.system(size: 80, weight: .heavy, design: .default))
