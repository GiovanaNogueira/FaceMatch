

//
//  ResultsView.swift
//  FaceDetector
//
//  Created by Giovana Nogueira on 26/03/24.
//

import Foundation
import SwiftUI

struct ResultsView: View {
    
    @State var nameBoxAppearing: Bool = false
    @Binding var result: FaceType
    @Binding var savedPeople: [Person]
    @State private var navigateToHistoryView = false
    
    var body : some View {
        ZStack {
            
            Color("background")
                .ignoresSafeArea()
            
            if result == .unknown{
                ErrorView(savedPeople: $savedPeople)
            }
            else{
            
                VStack {
                    ScrollView{
                        switch result {
                        case .oval:
                            FacialDiagnosis(facialType: .oval)
                        case .square:
                            FacialDiagnosis(facialType: .square)
                        case .round:
                            FacialDiagnosis(facialType: .round)
                        case .unknown:
                            Text("error")
                        }
                    }
                    
                    
                    Button(action: {
                        nameBoxAppearing = true
                    }, label: {
                        Text("Save analysis")
                    })
                    .buttonStyle(ChallengeZeroButton())
                    .foregroundColor(.anymodeWhite)
                }
                
            }
            
            if nameBoxAppearing {
                BlurView(style: .regular)
                    .ignoresSafeArea()
                
                NameBox(
                    nameBoxAppearing: $nameBoxAppearing,
                    result: $result,
                    savedPeople: $savedPeople
                )
            }
            
        }
        .navigationDestination(isPresented: $navigateToHistoryView) {
            HistoryView(savedPeople: $savedPeople)
        }

    }
}
