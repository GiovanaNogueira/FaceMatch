//
//  SwiftUIView.swift
//  challenge-1
//
//  Created by Catarina Liberato on 26/03/24.
//

import SwiftUI
import AVFoundation

struct FaceScanning: View {
    
    @Binding var currentScreen: Tela
    @Binding var dataHeight: [Float]
    @Binding var dataWidth: [Float]
    @Binding var dataAngle: [Float]
    @Binding var result: FaceType
    @Binding var dataCheekDist: [Float]
    @Binding var dataJawDist: [Float]
    @State private var isRunning = true
    
    var body: some View {
        
        ZStack {
            
//            Bg: camera
            
            GeometryReader { proxy in
                if isRunning{
                    JustMeshView(dataHeight: $dataHeight, dataWidth: $dataWidth, dataAngle: $dataAngle, result: $result, dataCheekDist: $dataCheekDist, dataJawDist: $dataJawDist)
                        .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 5, repeats: false){ _ in
                                DispatchQueue.main.async {
                                    isRunning = false
                                    currentScreen = .results
                                }
                            }
                            
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
            Image("faceScanning")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
    
}



//#Preview {
//    FaceScanning()
//}
