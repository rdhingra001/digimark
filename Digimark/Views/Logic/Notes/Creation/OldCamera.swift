//
//  Camera.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/25/22.
//

import AVFoundation
import SwiftUI

class OldCamera: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var isTaken: Bool = false
    @Published var session = AVCaptureSession()
    @Published var alert: Bool = false
    
    @Published var output = AVCapturePhotoOutput()
    
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    @Published var isSaved: Bool = false
    @Published var pictureData = Data(count: 0)
    
    func checkPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setup()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status {
                    self.setup()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    private func setup() {
        do {
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)!
            let input = try AVCaptureDeviceInput(device: device)
            
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(output) {
                self.session.addOutput(output)
            }
            
            self.session.commitConfiguration()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func takePicture() {
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()
            
            DispatchQueue.main.async {
                withAnimation { self.isTaken.toggle() }
            }
        }
    }
    
    func retakePicture() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation { self.isTaken.toggle() }
                self.isSaved = false
            }
        }
    }
    
    func savePicture() -> UIImage {
        let image = UIImage(data: self.pictureData)!
        self.exitSession()
        self.isSaved = true
        return image
    }
    
    func exitSession() {
        DispatchQueue.global(qos: .background).async {
            self.session.stopRunning()
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil {
            return
        }
        
        print("Picture taken")
        
        guard let imageData = photo.fileDataRepresentation() else { return }
        
        self.pictureData = imageData
    }
}
