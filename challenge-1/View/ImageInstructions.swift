//
//  ImageInstructions.swift
//  challenge-1
//
//  Created by Catarina Liberato on 01/04/24.
//

import SwiftUI

struct ImageInstructions: View {
    var body: some View {
        VStack {
            
            Image("userCorrect")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
                .padding()
            
            HStack (alignment:.top) {
                
                WrongImages(image: "userDark", txt: "Don't stay in the dark.")
                
                WrongImages(image: "userNotStraightFace", txt: "Keep a straight face.")
                
                WrongImages(image: "userGlasses", txt: "Don't wear glasses.")
            }
        }
    }
}

#Preview {
    ImageInstructions()
}
