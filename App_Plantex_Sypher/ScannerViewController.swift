//
//  ScannerViewController.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 19/12/24.
//
import UIKit

//class ScannerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    @IBOutlet weak var scanButton: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    @IBAction func scanSoilTapped(_ sender: UIButton) {
//        let alert = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
//            self.openCamera()
//        }))
//        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
//            self.openPhotoLibrary()
//        }))
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
//
//    private func openCamera() {
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = .camera
//            imagePicker.allowsEditing = true
//            self.present(imagePicker, animated: true, completion: nil)
//        } else {
//            print("Camera not available")
//        }
//    }
//
//    private func openPhotoLibrary() {
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = .photoLibrary
//            imagePicker.allowsEditing = true
//            self.present(imagePicker, animated: true, completion: nil)
//        }
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true, completion: nil)
//
//        // Get the selected image
//        guard let image = info[.editedImage] as? UIImage else {
//            print("No image found")
//            return
//        }
//
//        // Process the image
//        processScannedImage(image)
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//
//    private func processScannedImage(_ image: UIImage) {
//        // Mock Data: Replace this with CoreML or backend processing
//        let soilData = SoilModel(
//            soilType: "Alluvial Soil",
//            description: "Found in river plains, ideal for crops like rice and wheat.",
//            nitrogen: "0.02%",
//            phosphorus: "0.01%",
//            potassium: "0.2%",
//            organicMatter: "0.5%"
//        )
//
//        // Navigate to results screen
//        navigateToResultsScreen(with: soilData)
//    }
//
//    private func navigateToResultsScreen(with soilData: SoilModel) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let resultsVC = storyboard.instantiateViewController(withIdentifier: "SoilAnalysisViewController") as? SoilAnalysisViewController {
//            resultsVC.soilData = soilData
//            self.navigationController?.pushViewController(resultsVC, animated: true)
//        }
//    }
//}
