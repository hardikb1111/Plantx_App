//
//  LoginViewController.swift
//  App_Plantex_Sypher
//
//  Created by Harshit Malik on 17/01/25.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var PhoneNumber: UITextField!
    
    @IBOutlet weak var imgCol: UIImageView!
    
    @IBOutlet weak var otpButton: UIButton!
    
    @IBOutlet weak var otpField: UITextField!
    
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var resendOtp: UILabel!
    
    
    @IBOutlet weak var loginWithGoogle: UIButton!
    
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }

        private func setupUI() {
            // Setup for text fields
            styleTextField(PhoneNumber)
            styleTextField(otpField)
            
            // Setup for OTP button
            otpButton.isEnabled = true
//            otpButton.backgroundColor = .systemGray
            otpButton.layer.cornerRadius = 5 // Rounded corners
            
            // Setup for resend OTP label
            resendOtp.textColor = .black
            resendOtp.isHidden = true
            
            styleImageView(imgCol)
            styleButton(emailBtn)
            styleButton(loginWithGoogle)
        }
    private func styleButton(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
    }
    private func styleImageView(_ imageView: UIImageView) {
        let path = UIBezierPath(
                roundedRect: imageView.bounds,
                byRoundingCorners: [.bottomLeft, .bottomRight],
                cornerRadii: CGSize(width: 55, height: 55)
            )
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            imageView.layer.mask = mask
    }
        private func styleTextField(_ textField: UITextField) {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.cornerRadius = 5
            textField.backgroundColor = .white
            textField.textColor = .black
            textField.font = UIFont.systemFont(ofSize: 16)
            textField.setLeftPadding(10) // Custom padding for a Gmail-like appearance
        }

    @IBAction func otpButton(_ sender: UIButton) {
        
        guard let phone = PhoneNumber.text, !phone.isEmpty else {
                    
                    showAlert(message: "Please enter a phone number.")
                    return
                }

                
                otpButton.isEnabled = false
//                otpButton.backgroundColor = .systemGreen
                resendOtp.isHidden = false
                resendOtp.text = "OTP sent. Please wait..."
                resendOtp.textColor = .black

                // Start a timer to update the resendOtp label
                DispatchQueue.main.asyncAfter(deadline: .now() + 15) { [weak self] in
                    self?.resendOtp.text = "Resend OTP"
                    self?.resendOtp.textColor = .green

                    // After some more time, reset the resendOtp label
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                        self?.resendOtp.textColor = .gray
                        self?.resendOtp.text = "Request OTP again"
                        self?.otpButton.isEnabled = true
//                        self?.otpButton.backgroundColor = .systemGreen
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                        self?.resetUI()
                    }
                }
            }
            private func resetUI() {
                    otpButton.isEnabled = true
//                    otpButton.backgroundColor = .systemBlue
                    resendOtp.text = "Request OTP again"
                    resendOtp.textColor = .gray
                }
            private func showAlert(message: String) {
                let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
    
    
    
    
    }
extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}


    


