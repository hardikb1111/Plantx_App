//
//  ProfileViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 17/01/25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()

            if isUserLoggedIn() {
                // Load user details from UserDefaults
                let name = UserDefaults.standard.string(forKey: "userName")
                let profileImageName = UserDefaults.standard.string(forKey: "userProfileImage")

                // Set the label text and image
                userName.text = name

                if let profileImageName = profileImageName, let image = UIImage(named: profileImageName) {
                    profileImage.image = image
                } else {
                    profileImage.image = UIImage(named: "defaultProfileImage") // Set a
                }
                print()
                
                
            } else {
                
                navigateToLogin()
            }
        
        
        }
        
        // Check if user is logged in
        func isUserLoggedIn() -> Bool {
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
        }

        // Navigate to login page
        func navigateToLogin() {
            let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginDetailsViewController") as! AlreadyHaveAccViewController
            navigationController?.pushViewController(loginVC, animated: true)
            
            
        }
    
    
    @IBAction func LogOut(_ sender: UIButton) {
        
        
//        UserDefaults.standard.removeObject(forKey: "userEmail")
//        UserDefaults.standard.removeObject(forKey: "userPassword")
//        UserDefaults.standard.removeObject(forKey: "userName")
//        UserDefaults.standard.removeObject(forKey: "userProfileImage")
//        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        
        // Redirect to login page after logout
        navigateToLogin()
    }
    
}
    



