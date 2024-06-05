//
//  ContentView.swift
//  challenge-1
//
//  Created by Catarina Liberato on 21/03/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var savedPeople: [Person]
    
    @State private var isOnboardingComplete = UserDefaults.standard.bool(forKey: "isOnboardingComplete")
    

    var body: some View {
        NavigationStack {
            
            if isOnboardingComplete {
                Instructions(savedPeople: $savedPeople)
            }
            else{
                Onboarding(isOnboardingComplete: $isOnboardingComplete, savedPeople: $savedPeople)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
