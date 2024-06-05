//
//  imagesInstructions.swift
//  challenge-1
//
//  Created by Catarina Liberato on 01/04/24.
//

import SwiftUI

struct WrongImages: View {
    var image: String
    var txt: String
    var body: some View {
        
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80)
            Text(txt)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .frame(width:90)
                .foregroundStyle(Color("text"))
                                
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    WrongImages(image: "userDark", txt:"Lorem ipsum is bla oi slk")
}
