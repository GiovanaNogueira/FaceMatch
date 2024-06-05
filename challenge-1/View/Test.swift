//
//  Test.swift
//  challenge-1
//
//  Created by Catarina Liberato on 01/04/24.
//

import SwiftUI

struct Test: View {
    @State private var name: String = ""
    @Binding var savedPeople: [Person]
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 350, height: 250)
                .foregroundColor(Color("background"))
            
            VStack {
    
                Button(action: {
                    
                }, label: {
                    
                    HStack {
                        
                        Spacer()
                            .frame(width: 250)
                        
                        Image(systemName: "xmark")
                            .foregroundColor(Color("text"))
                            .opacity(0.4)

                    }
                    .padding(.bottom, 5)
                    
                })
                
                Text("Insert your name to save: ")
                    .font(.title2)
                    .foregroundColor(Color("text"))
                
                TextField("Example: Steve", text: $name)
                    .frame(width: 200)
                    .padding()
                    .textFieldStyle(UnderLinedText())
                    
//OPÇÃO 1:
//                Button(action: {
//                    //code to save
//                    //code to change page
//                }, label: {
//                    Text("Save")
//                })
//                .buttonStyle(ChallengeZeroButton())

//OPÇÃO 2:
                
                NavigationLink {
                    Instructions(savedPeople: $savedPeople) //Temporário, deve ir para HistoryView()
                } label: {
                    Text("Save")
                        .foregroundStyle(Color("background"))
                        .frame(width: 280, height: 50, alignment: .center)
                        .background(Color("buttonBlue"))
                        .cornerRadius(30)
                }
                .onTapGesture {
                    //Código para salvar
                }
                
                
            }
        }
        
    }
}

#Preview {
    Test(savedPeople: .constant([Person(name: "Giovana", faceType: .oval), Person(name: "Catarina", faceType: .round), Person(name: "Lucas", faceType: .square)]))
}
