//
//  ContentView.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 16/08/2022.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    init() {
        // Use this if NavigationBarTitle is with Large Font
        // Change color of navigation's title
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "trashColor") as Any]
        }
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 80) {
                
                CanvasView(lines: $viewModel.lines).cornerRadius(15).overlay(RoundedRectangle(cornerRadius: 15).stroke(C.gradient, lineWidth: 9))
                
                Button {
                    // Save image of CanvasView in image variable
                    let image = CanvasView(lines: $viewModel.lines).frame(width: C.canvasSize, height: C.canvasSize, alignment: .center).snapshot()
                    viewModel.classifyImage(image: image)
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
                        viewModel.clearCanvas()
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(Color("trashColor"))
                    }
                }
            }
        }.navigationViewStyle(.stack)
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


//                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)