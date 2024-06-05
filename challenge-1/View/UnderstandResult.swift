//
//  UnderstandResult.swift
//  challenge-1
//
//  Created by Catarina Liberato on 01/04/24.
//

import SwiftUI

struct UnderstandResult: View {
    var facialType: FaceType
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
    }
}

#Preview {
    UnderstandResult(facialType: .round)
}
