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
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           setupCamera()
       }
       
    func setupCamera() {
           captureSession = AVCaptureSession()
           
           // Set up the device and input
           guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
               print("Error: No video device available")
               return
           }
           
           let videoInput: AVCaptureDeviceInput
           do {
               videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
           } catch {
               print("Error accessing camera: \(error)")
               return
           }
           
           if captureSession.canAddInput(videoInput) {
               captureSession.addInput(videoInput)
           } else {
               print("Error: Could not add video input to the session")
               return
           }
           
           // Set up the photo output
           photoOutput = AVCapturePhotoOutput()
           if captureSession.canAddOutput(photoOutput) {
               captureSession.addOutput(photoOutput)
           }
           
           // Set up the preview layer
           previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
           previewLayer.frame = view.layer.bounds
           previewLayer.videoGravity = .resizeAspectFill
           view.layer.addSublayer(previewLayer)
           
           // Start the capture session on a background thread
           DispatchQueue.global(qos: .background).async { [weak self] in
               self?.captureSession.startRunning()
           }
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           
           // Stop the capture session on a background thread
           DispatchQueue.global(qos: .background).async { [weak self] in
               if self?.captureSession.isRunning == true {
                   self?.captureSession.stopRunning()
               }
           }
       }
    @IBAction func capture(_ sender: UIButton) {
        let settings = AVCapturePhotoSettings()
        settings.flashMode = .auto
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            if let error = error {
                print("Error capturing photo: \(error)")
                return
            }
            
            guard let imageData = photo.fileDataRepresentation(),
                  let image = UIImage(data: imageData) else {
                print("Error: Could not process image data")
                return
            }
            
            // Example: Update the label to notify the user
            DispatchQueue.main.async {
                self.Identify.text = "Photo Captured!"
            }
            
            // Show the alert asking whether to accept the photo or scan again
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Photo Captured", message: "Do you want to accept the photo or scan again?", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                    // Handle the OK action, e.g., save or close the scanner
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    self.dismiss(animated: true, completion: nil)
                }
                
                let scanAgainAction = UIAlertAction(title: "Scan Again", style: .cancel) { _ in
                    // Handle the scan again action
                    self.Identify.text = "Ready to Capture"
                }
                
                alertController.addAction(okAction)
                alertController.addAction(scanAgainAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
