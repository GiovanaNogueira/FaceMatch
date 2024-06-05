//
//  TypeDefinition.swift
//  FaceDetector
//
//  Created by Giovana Nogueira on 22/03/24.
//

import Foundation
import SwiftUI

struct Definition {
    
    func typeDefinition (height: [Float], width: [Float], angle: [Float], cheekDist: [Float], jawDist: [Float]) -> FaceType {
        
        var averageHeight: Float
        var averageWidth: Float
        var averageAngle: Float
        var averageCheekDist: Float
        var averageJawDist: Float
        var sumHeight: Float = 0
        var sumWidth: Float = 0
        var sumAngle: Float = 0
        var sumCheekDist: Float = 0
        var sumJawDist: Float = 0
        
        for item in height{
            sumHeight += item
        }
        
        for item in width{
            sumWidth += item
        }
        
        for item in angle{
            sumAngle += item
        }
        
        for item in cheekDist{
            sumCheekDist += item
        }
        
        for item in jawDist{
            sumJawDist += item
        }
        
        averageHeight = sumHeight/Float(height.count)
        averageWidth = sumWidth/Float(height.count)
        averageAngle = sumAngle/Float(height.count)
        averageCheekDist = sumCheekDist/Float(cheekDist.count)
        averageJawDist = sumJawDist/Float(jawDist.count)

        
        let ratio = averageWidth/averageHeight
        let ratioLimit: Float = 0.79
        let angleLimit: Float = 149.4
        let difference: Float = averageCheekDist - averageJawDist
        let difLimit: Float = 0.012
        
        
        if (ratio < ratioLimit){
            return .oval
        }
        else{
            
            if( averageAngle<angleLimit && difference < difLimit){
                return .square
            }
            
        }
        return .round
    }
    
}
