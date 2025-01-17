//
//  LoginDetailsViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 17/01/25.
//

import UIKit

class LoginDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var phoneTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var PassWordText: UITextField!
    
    @IBOutlet weak var cnfPassWordText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func onRegisterTapped(_ sender: UIButton) {
        guard let name = nameTxt.text, !name.isEmpty,
                  let phone = phoneTxt.text, !phone.isEmpty,
                  let email = emailTxt.text, !email.isEmpty,
                  let password = PassWordText.text, !password.isEmpty,
                  let confirmPassword = cnfPassWordText.text, !confirmPassword.isEmpty,
                  let userImageData = userImage.image?.jpegData(compressionQuality: 0.8) else {
                print("All fields are required.")
                return
            }
        
        
        let id = UUID()
            let imageBase64 = userImageData.base64EncodedString()

            UserDataModel.shared.addUser(
                id: id,
                name: name,
                email: email,
                password: password,
                confirmPassword: confirmPassword,
                phoneNumber: phone,
                image: imageBase64
            )
        
    }
    
    
}
