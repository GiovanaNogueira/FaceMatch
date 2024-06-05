
//
//  NameBox.swift
//  challenge-1
//
//  Created by Catarina Liberato on 01/04/24.
//

import SwiftUI

struct NameBox: View {
    @Binding var nameBoxAppearing: Bool
    @State private var name: String = ""
    @Binding var result: FaceType
    @Binding var savedPeople: [Person]
    @State private var temporaryInput: String = ""
    
    @State var shouldNavigate: Bool = false
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 350, height: 250)
                .foregroundColor(Color("background"))
            
            VStack {
                
                Button(action: {
                    
                    nameBoxAppearing = false
                    
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
                
                Button(action: {}) {
                    TextField("Example: Steve", text: $name)
                        .textFieldStyle(UnderLinedText())
                        .padding(10)
                        .frame(width: 200)
                }
            
                Button(action: {
                    let person = Person(name: name, faceType: result)
                    savedPeople.append(person)
                    try? savedPeople.save(in: "history")
                    shouldNavigate = true
                }, label: {
                    Text("Save")
                        .foregroundStyle(Color("background"))
                        .frame(width: 280, height: 50, alignment: .center)
                        .background(Color("buttonBlue"))
                        .cornerRadius(30)
                })
                .navigationDestination(isPresented: $shouldNavigate) {
                    HistoryView(savedPeople: $savedPeople)
                }
                
            }
            
        }
        
    }
}

//#Preview {
//    NameBox()
//}
//

