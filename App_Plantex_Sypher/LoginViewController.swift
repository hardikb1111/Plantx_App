//
//  LoginViewController.swift
//  App_Plantex_Sypher
//
//  Created by Harshit Malik on 17/01/25.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var PhoneNumber: UITextField!
    
    
    @IBOutlet weak var otpButton: UIButton!
    
    @IBOutlet weak var otpField: UITextField!
    
    @IBOutlet weak var resendOtp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func setupUI() {
        otpButton.isEnabled = true
        otpButton.backgroundColor = .gray
        resendOtp.textColor = .black
        resendOtp.isHidden = true
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


    


