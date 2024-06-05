//
//  Face.swift
//  FaceDetector
//
//  Created by Giovana Nogueira on 22/03/24.
//

import Foundation

class FaceDots{
    let forehead: Int = 20
    let bottomForehead: Int = 420
    let lForehead: Int = 948
    let rForehead: Int = 964
    let lCheekbone: Int = 940
    let rCheekbone: Int = 1028
    let lCheek: Int = 928
    let rCheek: Int = 1024
    let lJaw: Int = 462
    let rJaw: Int = 1216
    let lChin: Int = 916
    let rChin: Int = 912
    let bottomChin: Int = 914
    let upperChin: Int = 32
}

enum FaceType: Codable {
    case oval
    case square
    case round
    case unknown
    
    var imageName: String {
            switch self {
            case .oval:
                return "oval"
            case .square:
                return "square"
            case .round:
                return "round"
            case .unknown:
                return "unknownImageName"
            }
        }
    
    var imageNameWhite: String {
            switch self {
            case .oval:
                return "OvalWhite"
            case .square:
                return "SquareWhite"
            case .round:
                return "RoundWhite"
            case .unknown:
                return "unknownImageName"
            }
        }
    
    var description: String {
        switch self {
        case .oval:
            return "Distinguished by its balanced proportions and gentle curves, oval-shaped faces provide flexibility in selecting eyewear. Discover a diverse range of styles that complement your natural contours with elegance and sophistication."
        case .round:
            return "With smooth curves and rounded proportions, round-shaped faces provide numerous possibilities in eyewear selection. Explore styles that add length to the face and define its structure, creating a more sculpted appearance."
            
        case.square:
            return "Featuring angular lines and defined proportions, square-shaped faces offer versatility in eyewear selection. Discover styles that soften facial contours, creating a harmonious and balanced appearance."
            
        case .unknown:
            return "Error"
        }
    }
    
    var glassesExamples: [Glasses] {
        switch self{
        case .oval:
            return [squareOneGlasses,roundOneGlasses,cateyeGlasses]
        case .square:
            return [roundOneGlasses, roundTwoGlasses]
        case .round:
            return [squareOneGlasses,squareTwoGlasses,squareThreeGlasses]
        case .unknown:
            return []
        }
    }
}


