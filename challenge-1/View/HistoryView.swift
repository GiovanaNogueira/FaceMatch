//
//  HistoryView.swift
//  challenge-1
//
//  Created by Giovana Nogueira on 02/04/24.
//

import SwiftUI

struct HistoryView: View {
    
    @Binding var savedPeople: [Person]
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    ForEach(savedPeople, id: \.name){ person in
                        NavigationLink(destination: FacialDiagnosis(facialType: person.faceType)){
                            HStack{
                                Image(person.faceType.imageNameWhite)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .padding(.horizontal, 25)
                                Text(person.name)
                                    .foregroundStyle(.white)
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                            }
                            .frame(width: 353, height: 80, alignment: .center)
                            .background(Color("buttonBlue"))
                            .cornerRadius(10)
                            
                        }
                    }
                }
                .navigationTitle("History")
                .padding(.top, 40)
            }
        }
        .background(Color.background.ignoresSafeArea().scaledToFill())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}


#Preview {
    HistoryView(savedPeople: .constant([Person(name: "Giovana", faceType: .oval), Person(name: "Catarina", faceType: .round), Person(name: "Lucas", faceType: .square)]))
}
