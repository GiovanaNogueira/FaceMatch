//
//  ElementsStyle.swift
//  challenge-1
//
//  Created by Catarina Liberato on 01/04/24.
//

import Foundation
import SwiftUI

//MARK: - BLUR
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // do nothing
    }
}

//MARK: - ESTILO DO TEXTO NO TEXT FIELD UTILIZADO
struct UnderLinedText: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        VStack(alignment: .leading) {
            configuration
            
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(Color(UIColor.separator))
        }
    }
}

//MARK: - ESTILO UTILIZADO NOS BOTÕES
struct ChallengeZeroButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .frame(width: 300, height: 50, alignment: .center)
            .background(Color("buttonBlue"))
            .cornerRadius(30)
    }
}

struct HistoryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .frame(width: 353, height: 80, alignment: .center)
            .background(Color("buttonBlue"))
            .cornerRadius(30)
    }
}

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .foregroundColor(.buttonBlue) 
        }
    }
}
