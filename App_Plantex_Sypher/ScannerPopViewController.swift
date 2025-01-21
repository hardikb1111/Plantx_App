//
//  ScannerPopViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 20/01/25.
//

import UIKit

class ScannerPopViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func ShowPopUp(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Scanner", bundle: nil)
               
               // Instantiate the view controller with the storyboard ID
               let popupVC = storyboard.instantiateViewController(withIdentifier: "PopupViewController")
               
               // Set the modal presentation style to make it appear as a pop-up
               popupVC.modalPresentationStyle = .formSheet
               popupVC.modalTransitionStyle = .crossDissolve
               
               // Present the view controller
               self.present(popupVC, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
