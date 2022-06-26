//
//  CameraPreview.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/25/22.
//

import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera: Camera
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: getRect())
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
