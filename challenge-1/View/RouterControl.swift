//
//  RouterControl.swift
//  challenge-1
//
//  Created by Giovana Nogueira on 27/03/24.
//

import SwiftUI

enum Tela: Int{
    case faceDetection
    case results
}

struct RouterControl: View {
    
    @State var currentScreen = Tela.faceDetection
    @State var dataHeight: [Float] = []
    @State var dataWidth: [Float] = []
    @State var dataAngle: [Float] = []
    @State var result: FaceType = .unknown
    @State var dataCheekDist: [Float] = []
    @State var dataJawDist: [Float] = []
    @Binding var savedPeople: [Person]
    
    var body: some View {
        
        switch currentScreen {
        case .faceDetection:
            FaceScanning(currentScreen: $currentScreen, dataHeight: $dataHeight, dataWidth: $dataWidth, dataAngle: $dataAngle, result: $result, dataCheekDist: $dataCheekDist, dataJawDist: $dataJawDist)
        case .results:
            // NavigationStack {
                ResultsView(result: $result, savedPeople: $savedPeople)
            //}
        }
        
    }
}

//#Preview {
//    RouterControl()
//}
