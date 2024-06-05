//
//  facialDiagnosis.swift
//  challenge-1
//
//  Created by Catarina Liberato on 01/04/24.
//

import SwiftUI

struct FacialDiagnosis: View {
    
    var facialType: FaceType
    
    var body: some View {
        ScrollView{
            
            VStack {
                
                Image(facialType.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding()
                
                Text("Your face is '\(facialType.self)'")
                    .font(.title2)
                    .padding(.bottom, 30)
                
                UnderstandResult(facialType: facialType)
                
                RecommendedShapes(facialType: facialType)
                
            }
        }
        .navigationTitle("Result")
        .background(Color.background.ignoresSafeArea().scaledToFill())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }

        }

#Preview {
    FacialDiagnosis(facialType: .square)
}
