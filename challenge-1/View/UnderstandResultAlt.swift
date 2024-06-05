//
//  UnderstandResult.swift
//  challenge-1
//
//  Created by Catarina Liberato on 01/04/24.
//

import SwiftUI

struct UnderstandResultAlt: View {
    var facialType: FaceShape
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text("Understand your result:")
                .font(.title3)
                .padding(.horizontal)
            
            Text(facialType.description)
                .multilineTextAlignment(.leading)
                .padding(.vertical, 7)
                .padding(.horizontal)
        }
        .background(Color("backgroundAltered"))
        .cornerRadius(15)
        .padding()
    }
}

#Preview {
    UnderstandResultAlt(facialType: round)
}
