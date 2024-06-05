//
//  challenge_1App.swift
//  challenge-1
//
//  Created by Catarina Liberato on 21/03/24.
//

import SwiftUI

@main
struct challenge_1App: App {
    
    @State var savedPeople: [Person] = (try? [Person].load(from: "history")) ?? []
    
    var body: some Scene {
        WindowGroup {
            OpeningView(savedPeople: $savedPeople)
//            ContentView(savedPeople: $savedPeople)
        }
    }
}
