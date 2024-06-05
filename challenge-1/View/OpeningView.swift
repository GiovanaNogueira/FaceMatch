//
//  OpeningView.swift
//  challenge-1
//
//  Created by Catarina Liberato on 04/04/24.
//

import SwiftUI

struct OpeningView: View {
    
    @Binding var savedPeople: [Person]
    @State private var isActive: Bool = false
    @State private var rectangleOffset = CGSize(width: 0, height: 0)
    @State private var isRectangleVisible = true
    
    var body: some View {
        if isActive {
            ContentView(savedPeople: $savedPeople)
        }
        else{
            
            ZStack {
                
                Image("opening")
                    .resizable()
                    .ignoresSafeArea()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            self.isActive = true
                        }
                    }
                
                Rectangle()
                    .foregroundStyle(Color("beige"))
                    .frame(height:100)
                    .offset(rectangleOffset)
                    .offset(rectangleOffset)
                    .animation(Animation.easeInOut(duration: 1).repeatCount(1, autoreverses: false))
                    .onAppear {
                        withAnimation {
                            self.rectangleOffset = CGSize(width: 0, height: -45)
                        }
                    }
            }
        }
    }
}

#Preview {
    OpeningView(savedPeople: .constant([Person(name: "Giovana", faceType: .oval)]))
}
