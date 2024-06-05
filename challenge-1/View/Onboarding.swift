
//  Onboarding.swift
//  challenge-1
//
//  Created by Catarina Liberato on 25/03/24.
//

import SwiftUI

// MARK: - Step Model:

struct Step {
    let txt: String
    let image: String
}

// MARK: - List of onboarding steps:

let stepList: [Step] = [
    Step(txt: "Unlock insights about your face shape with our analysis tool.", image: "obOne"),
    Step(txt: "Explore our eyewear collection crafted to enhance your features.", image: "obTwo")
]

// MARK: - Onboarding View:
struct Onboarding: View {
    @State private var currentStep = 0
    @Binding var isOnboardingComplete: Bool
    @Binding var savedPeople: [Person]
    
    
    var body: some View {
        
        TabView(selection: $currentStep) {
            if isOnboardingComplete {
                
                Instructions(savedPeople: $savedPeople)
             } else {
                ForEach(0..<stepList.count){ index in
                    
                    VStack {
                        
                        Spacer().frame(height: 100)
                                                
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        
                        Spacer()
                        
                        //Step text:
                        Text(stepList[index].txt)
                            .font(Font.custom("SF Pro", size: 22))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color("anymodeWhite"))
                            .frame(width: 350)
                        
                        //"Next" button:
                        Button(action: {
                            if self.currentStep < stepList.count - 1 {
                                self.currentStep += 1
                            } else {
                                UserDefaults.standard.set(true, forKey: "isOnboardingComplete")
                                isOnboardingComplete = true
                            }
                        }, label: {
                            
                            Text(currentStep < stepList.count - 1 ? "Next" : "Get started")
                                .foregroundStyle(Color("anymodeWhite"))
                            
                        })
                        .buttonStyle(ChallengeZeroButton())
                        .padding()
                           
                        //Step indicator circles:
                        HStack{
                            ForEach(0..<stepList.count) {it in
                                if it == currentStep {
                                    
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(Color("anymodeWhite"))
                                    
                                } else {
                                    
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(Color("anymodeWhite"))
                                        .opacity(0.3)
                                    
                                }
                            }
                        }
                        .padding()
                        
                        Spacer().frame(height: 50)
                        
                    }
                    .tag(index)
                    .background{
                        
                        Image(stepList[index].image)
                            .resizable()
                            .scaledToFill()

                            
                    }
                    .ignoresSafeArea()
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        }
    }
}

#Preview {
    Onboarding(isOnboardingComplete: .constant(false), savedPeople: .constant([Person(name: "Giovana", faceType: .oval), Person(name: "Catarina", faceType: .round), Person(name: "Lucas", faceType: .square)]))
}
