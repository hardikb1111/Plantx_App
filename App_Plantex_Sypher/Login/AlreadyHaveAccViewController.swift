//
//  AlreadyHaveAccViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 25/01/25.
//

import UIKit

class AlreadyHaveAccViewController: UIViewController {

    @IBOutlet weak var UserEmail: UITextField!
    
    @IBOutlet weak var UserPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        guard let email = UserEmail.text, !email.isEmpty,
                      let password = UserPassword.text, !password.isEmpty else {
                    showErrorAlert(message: "Both email and password are required.")
                    return
                }

                // Retrieve stored email and password from UserDefaults (or ideally, a secure storage)
                if let storedEmail = UserDefaults.standard.string(forKey: "userEmail"),
                   let storedPassword = UserDefaults.standard.string(forKey: "userPassword"),
                   email == storedEmail && password == storedPassword {

                    // If credentials match, log the user in
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")

                    // Navigate to the Profile view
                    navigateToProfile()

                } else {
                    // If credentials don't match, show an error
                    showErrorAlert(message: "Incorrect email or password.")
                }
    }
    func showErrorAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }

        func navigateToProfile() {
            if let profileVC = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
                navigationController?.pushViewController(profileVC, animated: true)
            }
        }
    
   

}
