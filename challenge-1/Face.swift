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
    let lJaw: Int = 462/*392*/
    let rJaw: Int = 1216/*822*/
    let lChin: Int = 916
    let rChin: Int = 912
    let bottomChin: Int = 914
    let upperChin: Int = 32
}

enum FaceType {
    case oval
    case square
    case round
    case unknown
}

