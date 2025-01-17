//
//  LoginDetailsViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 17/01/25.
//

import UIKit

class LoginDetailsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var phoneTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var PassWordText: UITextField!
    
    @IBOutlet weak var cnfPassWordText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Make userImage round
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
                userImage.clipsToBounds = true

                // Enable user interaction for userImage
                userImage.isUserInteractionEnabled = true

                // Add tap gesture recognizer to userImage
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
               userImage.addGestureRecognizer(tapGesture)
           }
           
           @objc func selectImage() {
               let imagePicker = UIImagePickerController()
               imagePicker.delegate = self
               imagePicker.sourceType = .photoLibrary
               present(imagePicker, animated: true, completion: nil)
           }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                userImage.image = selectedImage // Display the selected image
            }
            dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    
    @IBAction func onRegisterTapped(_ sender: UIButton) {
 
    
        
        guard let name = nameTxt.text, !name.isEmpty,
                  let phone = phoneTxt.text, !phone.isEmpty,
                  let email = emailTxt.text, !email.isEmpty,
                  let password = PassWordText.text, !password.isEmpty,
                  let confirmPassword = cnfPassWordText.text, !confirmPassword.isEmpty else {
                
                // Show error message
                showErrorAlert(message: "All fields are required.")
                return
            }
            
            // Optional: Validate password match
            if password != confirmPassword {
                showErrorAlert(message: "Passwords do not match.")
                return
            }
            
            // If all validations pass, print the values
            print("Name: \(name)")
            print("Phone: \(phone)")
            print("Email: \(email)")
            print("Password: \(password)")
            print("Confirm Password: \(confirmPassword)")
//
//        
            let id = UUID()
//            let imageBase64 = userImageData.base64EncodedString()

            UserDataModel.shared.addUser(
                id: id,
                name: name,
                email: email,
                password: password,
                confirmPassword: confirmPassword,
                phoneNumber: phone,
                image: "blank-profile-picture-973460_1280"
            )
        
    }
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    
}
