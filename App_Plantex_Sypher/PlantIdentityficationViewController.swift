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
        styleLabels()
    }
    private func setupPlantDetails() {
           // Dummy data for plant details
           plantImg.image = UIImage(named: "") 
           plantLbl.text = "Plant Information"
           plnatName.text = "Aloe Vera"
           plnatDsc.text = """
           Aloe Vera is a succulent plant species well known for its medicinal properties, particularly in skincare. \
           It thrives in arid conditions and requires minimal maintenance, making it ideal for homes and offices.
           """
           Height.text = "Height"
           HeightValue.text = "30 - 50 cm"
           Water.text = "Water Needs"
           waterValue.text = "Moderate; water every 2-3 weeks"
           Light.text = "Light Requirements"
           LightValue.text = "Bright Indirect Light; avoid direct sunlight"
           Humidity.text = "Humidity"
           HumidityValue.text = "Low to Moderate; tolerates dry air"
       }

       private func styleLabels() {
           // Styling headings (larger size, bold)
           let headingFont = UIFont.systemFont(ofSize: 20, weight: .bold)
           let valueFont = UIFont.systemFont(ofSize: 16, weight: .regular)

           plantLbl.font = UIFont.systemFont(ofSize: 24, weight: .bold) // Larger title
           plantLbl.textAlignment = .center

           [Height, Water, Light, Humidity].forEach { label in
               label?.font = headingFont
           }

           // Styling values (smaller size, regular)
           [HeightValue, waterValue, LightValue, HumidityValue].forEach { label in
               label?.font = valueFont
           }

           // Styling the description text
           plnatDsc.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           plnatDsc.textAlignment = .justified
           plnatDsc.isEditable = false // Prevent editing
           plnatDsc.backgroundColor = UIColor.clear // Match background
       }

    

}
