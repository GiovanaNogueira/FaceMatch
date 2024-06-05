//
//  VectorController.swift
//  FaceDetector
//
//  Created by Giovana Nogueira on 22/03/24.
//

import Foundation

struct Vector2D {
    var x: Float
    var y: Float
    
    func dotProduct( v: Vector2D) -> Float {
        return self.x * v.x + self.y * v.y
    }
    
    func module() -> Float {
        return sqrt(x * x + y * y)
    }
    
    func angle (v: Vector2D) -> Float {
        let moduleU = self.module()
        let moduleV = v.module()
        
        let moduleProduct = moduleU*moduleV
        let productUV = self.dotProduct(v: v)
        
        let angle = acos(productUV/moduleProduct) * 180 / Float.pi
        return angle
    }
}
