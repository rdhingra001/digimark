//
//  CaptureView.swift
//  Digimark
//
//  Created by Ronit Dhingra on 6/25/22.
//

import SwiftUI

struct CaptureView: View {
    @StateObject var camera = Camera()
    @State var outputImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            // Will be camera preview
            CameraPreview(camera: camera)
                .ignoresSafeArea()
            
            // Controls
            VStack {
                HStack {
                    Spacer()
                    Button {
                        camera.exitSession()
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding()
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                    }
                    .padding(.trailing, 10)
                }
                .padding()
                Spacer()
                Spacer()
                HStack {
                    if camera.isTaken {
                        Button {
                            self.outputImage = camera.savePicture()
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Save")
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(.white)
                                .clipShape(Capsule())
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        Button {
                            camera.retakePicture()
                        } label: {
                            Text("Retake")
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(.white)
                                .clipShape(Capsule())
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        }
                        .padding(.trailing)
                    }
                    else {
                        Button {
                            camera.takePicture()
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 65, height: 65)
                                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .frame(width: 75, height: 75)
                            }
                        }
                    }
                }
                .frame(height: 75)
            }
        }
        .onAppear {
            camera.checkPermissions()
        }
    }
}

struct CaptureView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureView()
    }
}
