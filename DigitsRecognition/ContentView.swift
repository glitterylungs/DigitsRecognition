//
//  ContentView.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 16/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "trashColor") as Any]
        }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 80) {
                CanvasView()
                Text("2")
                    .foregroundColor(Color("textColor"))
                    .font(.system(size: 80, weight: .heavy, design: .default))
                Spacer()
            }.padding(.top, 40)
            .navigationTitle("DigsReco")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Clear tapped")
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


