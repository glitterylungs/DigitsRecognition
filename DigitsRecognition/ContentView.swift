//
//  ContentView.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 16/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        VStack(alignment: .center, spacing: 80) {
            CanvasView()
            Text("2")
                .foregroundColor(.red)
                .font(.system(size: 70))
                .fontWeight(.heavy)
                
            Spacer()
        }.padding(.top, 40)
        .navigationTitle("DigsReco")
     //   .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Clear") {
                    print("Clear tapped")
                }
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
