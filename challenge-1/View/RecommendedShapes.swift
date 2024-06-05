//
//  RecommendedShapes.swift
//  challenge-1
//
//  Created by Catarina Liberato on 01/04/24.
//

import SwiftUI

struct RecommendedShapes: View {
    var facialType: FaceType
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text("Recommended shapes:")
                .font(.title3)
                .padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(facialType.glassesExamples, id: \.image) { glasses in
                        
                        VStack {
                            
                            Image(glasses.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                                .padding(.horizontal)
                            
                            Text(glasses.name)
                            
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                .padding(.bottom, 50)

                

            }
        }
    }
}
#Preview {
    RecommendedShapes(facialType: .round)
}
