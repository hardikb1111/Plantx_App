//
//  ScannerViewController.swift
//  App_Plantex_Sypher
//
//  Created by Harshit Malik on 17/01/25.
//

import UIKit
import AVFoundation

class ScannerViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var photoOutput: AVCapturePhotoOutput!
    
    @IBOutlet weak var Identify: UILabel!
    
    @IBAction func closeScanner(_ sender: UIButton) {   self.dismiss(animated: true, completion: nil)
    }
    @IBAction func captureButton(_ sender: Any) {
        guard let connection = previewLayer.connection else { return }
            connection.videoOrientation = .portrait

            let photoOutput = AVCapturePhotoOutput()
            if captureSession.canAddOutput(photoOutput) {
                captureSession.addOutput(photoOutput)
            }

            let settings = AVCapturePhotoSettings()
            photoOutput.capturePhoto(with: settings, delegate: self)
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        captureSession = AVCaptureSession()

        // Set up the device and input
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            print("Error accessing camera: \(error)")
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            print("Could not add video input")
            return
        }

        // Set up the preview layer
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession.isRunning) {
            captureSession.stopRunning()
        }
        
    }
}
