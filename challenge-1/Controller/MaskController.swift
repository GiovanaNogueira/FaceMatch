//
//  MaskController.swift
//  FaceDetector
//
//  Created by Giovana Nogueira on 21/03/24.

import Foundation
import UIKit
import ARKit
import SwiftUI

class JustMeshViewController: UIViewController {
    
    var arView: ARSCNView = ARSCNView()
    var labels:[Int:SCNNode] = [:]
    
    @Binding var dataHeight: [Float]
    @Binding var dataWidth: [Float]
    @Binding var dataAngle: [Float]
    @Binding var dataCheekDist: [Float]
    @Binding var dataJawDist: [Float]
    
    
    @Binding var result: FaceType
    

    init(dataHeight: Binding<[Float]>, dataWidth: Binding<[Float]>, dataAngle: Binding<[Float]>, result: Binding<FaceType>, dataCheekDist: Binding<[Float]>, dataJawDist: Binding<[Float]>) {
        self._dataHeight = dataHeight
        self._dataWidth = dataWidth
        self._dataAngle = dataAngle
        self._result = result
        self._dataCheekDist = dataCheekDist
        self._dataJawDist = dataJawDist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device")
        }
        
        self.view.addSubview(arView)
        arView.translatesAutoresizingMaskIntoConstraints = false
        arView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        arView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        arView.delegate = self
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARFaceTrackingConfiguration()
        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arView.session.pause()
    }
}


extension JustMeshViewController: ARSCNViewDelegate {
    
    // Adding a Mesh Mask
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = arView.device,
              let faceAnchor = anchor as? ARFaceAnchor,
              let faceGeometry = ARSCNFaceGeometry(device: device) else { return nil }
        let node = SCNNode(geometry: faceGeometry)
        node.geometry?.firstMaterial?.transparency = .zero
        printVertices(faceAnchor: faceAnchor, in: node)
        return node
    }
    
    // Updating the Mesh Mask
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard
            let faceAnchor = anchor as? ARFaceAnchor,
            let faceGeometry = node.geometry as? ARSCNFaceGeometry
        else { return }
        faceGeometry.update(from: faceAnchor.geometry)
        
        printVertices(faceAnchor: faceAnchor, in: node, addLabel: false)
    
    }
    
    func distance (x1: Float, y1: Float, x2: Float, y2: Float) -> Float {
        let deltaX: Float = x1 - x2
        let deltaY:  Float = y1 - y2
        let dist:  Float  = sqrt(pow(deltaX, 2) + pow(deltaY, 2))
        
        return dist
    }
    
    func printVertices(faceAnchor: ARFaceAnchor, in node: SCNNode, addLabel:Bool = true){
        
        let face = FaceDots()
        let def = Definition()
        
        
        for index in 0..<faceAnchor.geometry.vertices.count{
            guard [face.bottomChin, face.lCheek, face.lCheekbone, face.lChin, face.lForehead, face.lJaw, face.rCheek, face.rCheekbone, face.rChin, face.rForehead, face.rJaw, face.upperChin, face.forehead].contains(index) else {continue}
            guard index%2 == 0 else {continue}
            
            let position = SCNVector3Make(faceAnchor.geometry.vertices[index].x*1.0,faceAnchor.geometry.vertices[index].y*1.0,faceAnchor.geometry.vertices[index].z)
            labels[index]?.position = position
            
            let alturaRosto = distance(x1: faceAnchor.geometry.vertices[face.forehead].x*1.0, y1: faceAnchor.geometry.vertices[face.forehead].y*1.0, x2: faceAnchor.geometry.vertices[face.bottomChin].x*1.0, y2: faceAnchor.geometry.vertices[face.bottomChin].y*1.0)
            
            let larguraRosto = distance(x1: faceAnchor.geometry.vertices[face.lCheekbone].x*1.0, y1: faceAnchor.geometry.vertices[face.lCheekbone].y*1.0, x2: faceAnchor.geometry.vertices[face.rCheekbone].x*1.0, y2: faceAnchor.geometry.vertices[face.rCheekbone].y*1.0)
            
            let larguraBochecha = distance(x1: faceAnchor.geometry.vertices[face.lCheek].x*1.0, y1: faceAnchor.geometry.vertices[face.lCheek].y*1.0, x2: faceAnchor.geometry.vertices[face.rCheek].x*1.0, y2: faceAnchor.geometry.vertices[face.rCheek].y*1.0)
            
            let larguraMaxilar = distance(x1: faceAnchor.geometry.vertices[face.lJaw].x*1.0, y1: faceAnchor.geometry.vertices[face.lJaw].y*1.0, x2: faceAnchor.geometry.vertices[face.rJaw].x*1.0, y2: faceAnchor.geometry.vertices[face.rJaw].y*1.0)
        
            let vetor1 = Vector2D(x: faceAnchor.geometry.vertices[face.lCheek].x*1.0 - faceAnchor.geometry.vertices[face.lJaw].x*1.0 , y: faceAnchor.geometry.vertices[face.lCheek].y*1.0 - faceAnchor.geometry.vertices[face.lJaw].y*1.0)
            
            let vetor2 = Vector2D(x: faceAnchor.geometry.vertices[face.lChin].x*1.0 - faceAnchor.geometry.vertices[face.lJaw].x*1.0, y: faceAnchor.geometry.vertices[face.lChin].y*1.0 - faceAnchor.geometry.vertices[face.lJaw].y*1.0)
            
            let angle = vetor1.angle(v: vetor2)
            
            dataAngle.append(angle)
            dataWidth.append(larguraRosto)
            dataHeight.append(alturaRosto)
            dataCheekDist.append(larguraBochecha)
            dataJawDist.append(larguraMaxilar)
            
        }
        
        result = def.typeDefinition(height: dataHeight, width: dataWidth, angle: dataAngle, cheekDist: dataCheekDist, jawDist: dataJawDist)
        print(result)
    }
    
  
}

struct JustMeshView: UIViewControllerRepresentable {
    @Binding var dataHeight: [Float]
    @Binding var dataWidth: [Float]
    @Binding var dataAngle: [Float]
    @Binding var dataCheekDist: [Float]
    @Binding var dataJawDist: [Float]
    @Binding var result: FaceType

    init(dataHeight: Binding<[Float]>, dataWidth: Binding<[Float]>, dataAngle: Binding<[Float]>, result: Binding<FaceType>, dataCheekDist: Binding<[Float]>, dataJawDist: Binding<[Float]>) {
        self._dataHeight = dataHeight
        self._dataWidth = dataWidth
        self._dataAngle = dataAngle
        self._result = result
        self._dataCheekDist = dataCheekDist
        self._dataJawDist = dataJawDist
    }

    func makeUIViewController(context: Context) -> JustMeshViewController {
        JustMeshViewController(dataHeight: $dataHeight, dataWidth: $dataWidth, dataAngle: $dataAngle, result: $result, dataCheekDist: $dataCheekDist, dataJawDist: $dataJawDist)
    }

    func updateUIViewController(_ uiViewController: JustMeshViewController, context: Context) {
        // Optional: Implement any updates if needed
    }
}


