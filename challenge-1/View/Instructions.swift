//
//  Instructions.swift
//  challenge-1
//
//  Created by Catarina Liberato on 26/03/24.
//

import SwiftUI

struct Instructions: View {
    
    @Binding var savedPeople: [Person]
    
    var body: some View {
        ZStack {
            
            Color("background")
                .ignoresSafeArea()
            
            VStack{
                
                Image("logoV2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .padding(.bottom, 40)
                
                ImageInstructions()
                
                Text("For an efficient analysis, follow the instructions.")
                    .font(.title2)
                    .frame(width: 290)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("text"))
                    .padding()
                
                VStack {
                    
                    NavigationLink(destination: RouterControl(savedPeople: $savedPeople)) {
                        Text("Scan")
                            .foregroundStyle(Color("background"))
                            .frame(width: 280, height: 50, alignment: .center)
                            .background(Color("buttonBlue"))
                            .cornerRadius(30)
                    }
                    .padding(2)
                    
                    if !savedPeople.isEmpty{
                        NavigationLink(destination: HistoryView(savedPeople: $savedPeople) /*destination: RouterControl()*/) {
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color("buttonBlue"), lineWidth: 2)
                                    .frame(width: 280, height: 50)
                                
                                Text("Go to history")
                                    .foregroundColor(Color("buttonBlue"))
                                    .frame(width: 280, height: 50, alignment: .center)
                                    .background(Color.clear)
                            }
                        }
                        .padding(2)
                    }
                }
                .padding(.top, 40)
            }
        }
    }
}

//#Preview {
//    Instructions()
//}
