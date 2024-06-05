//
//  ErrorView.swift
//  challenge-1
//
//  Created by Giovana Nogueira on 04/04/24.
//

import SwiftUI

struct ErrorView: View {
    
    @Binding var savedPeople: [Person]
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            VStack{
                Image("logoV2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .padding(.bottom, 40)
                
                Image(systemName: "person.crop.circle.badge.exclamationmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180)
                    .padding()
                    .padding(.top, 100)
                    .padding(.trailing, 40)
                    .foregroundColor(.buttonBlue)
                
                Text("Position your face within the indicated area for an accurate scan")
                    .font(.title2)
                    .frame(width: 350)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("text"))
                    .padding()
                    .padding(.bottom, 130)
                
                NavigationLink(destination: RouterControl(savedPeople: $savedPeople)) {
                    Text("Try again")
                        .foregroundStyle(Color("background"))
                        .frame(width: 280, height: 50, alignment: .center)
                        .background(Color("buttonBlue"))
                        .cornerRadius(30)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    ErrorView(savedPeople: .constant([Person(name: "Giovana", faceType: .oval)]))
}
