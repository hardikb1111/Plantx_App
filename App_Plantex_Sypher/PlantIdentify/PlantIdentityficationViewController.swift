//
//  PlantIdentityficationViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 17/01/25.
//

import UIKit

class PlantIdentityficationViewController: UIViewController {

    @IBOutlet weak var plantImg: UIImageView!
    
    
    @IBOutlet weak var plantLbl: UILabel!
    
    @IBOutlet weak var plnatName: UILabel!
    
    @IBOutlet weak var plnatDsc: UITextView!
    
    
    @IBOutlet weak var Height: UILabel!
    
    @IBOutlet weak var HeightValue: UILabel!
    
    
    @IBOutlet weak var Water: UILabel!
    
    @IBOutlet weak var waterValue: UILabel!
    
    
    @IBOutlet weak var Light: UILabel!
    
    
    @IBOutlet weak var LightValue: UILabel!
    
    
    @IBOutlet weak var Humidity: UILabel!
    
    @IBOutlet weak var HumidityValue: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupPlantDetails()
        
    
    }
    private func setupPlantDetails() {
           // Dummy data for plant details
           plantImg.image = UIImage(named: "scanplant")
           plantLbl.text = "Hurray, we identified the Plant !"
           plnatName.text = "Aloe Vera"
           plnatDsc.text = """
           Aloe Vera is a succulent plant species well known for its medicinal properties, particularly in skincare. \
           It thrives in arid conditions and requires minimal maintenance, making it ideal for homes and offices.
           """
           Height.text = "Height"
           HeightValue.text = "30 - 50 cm"
           Water.text = "2-3 weeks"
           waterValue.text = "water"
           Light.text = "Light "
           LightValue.text = "Indirect Light"
           Humidity.text = "Low"
           HumidityValue.text = "Humidity"
       }
    

      
    

}
