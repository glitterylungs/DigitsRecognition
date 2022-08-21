//
//  ResultView.swift
//  DigitsRecognition
//
//  Created by Alicja Gruca on 21/08/2022.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var classificationLabel: String
    
    var body: some View {
        Text(classificationLabel)
            .padding(.horizontal ,C.canvasSize / 4)
            .padding(.vertical, C.canvasSize / 4 - 20)
            .foregroundColor(Color("trashColor"))
            .font(.system(size: 100, weight: .heavy, design: .default))
            .background(.white)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(C.gradient, lineWidth: 9))

    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(classificationLabel: .constant("10"))
    }
}





