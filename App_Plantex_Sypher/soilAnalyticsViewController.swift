//
//  soilAnalyticsViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 16/01/25.
//

import UIKit

class soilAnalyticsViewController: UIViewController {
    
    
    @IBOutlet weak var soilImg: UIImageView!
    
    @IBOutlet weak var soilLbl: UILabel!
    
    
    @IBOutlet weak var soillName: UILabel!
    
    
    @IBOutlet weak var tsoilTxt: UITextView!
    
    
    @IBOutlet weak var NitroQuantity: UILabel!
    
    @IBOutlet weak var NitroValue: UILabel!
    
    @IBOutlet weak var PhosQuantity: UILabel!
    
    @IBOutlet weak var PhosValue: UILabel!
    
    @IBOutlet weak var PotaQuantity: UILabel!
    @IBOutlet weak var PotaValue: UILabel!
    
    @IBOutlet weak var OrgMattterQu: UILabel!
    @IBOutlet weak var OrgMatterValue: UILabel!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            soilLbl.text = "Hurray, we identified the Soil !"
            // Create dummy data
            createDummySoilData()
            
            // Fetch the first soil scan (you can update this to fetch a specific scan based on your logic)
            if let soilScan = SoilScanModel.shared.getAllSoilScans().first {
                soilImg.image = UIImage(named: soilScan.image)
                soillName.text = soilScan.name
                tsoilTxt.text = soilScan.description
                
                // Set nutrient values (ensure nutrient names match exactly)
                let nutrients = soilScan.nutrients
                NitroQuantity.text = "Nitrogen"
                       NitroQuantity.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                       NitroValue.text = "\(nutrients.first { $0.name == "Nitrogen" }?.value ?? .low)"
                       
                       PhosQuantity.text = "Phosphorus"
                       PhosQuantity.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                       PhosValue.text = "\(nutrients.first { $0.name == "Phosphorus" }?.value ?? .low)"
                       
                       PotaQuantity.text = "Potassium"
                       PotaQuantity.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                       PotaValue.text = "\(nutrients.first { $0.name == "Potassium" }?.value ?? .low)"
                       
                       OrgMattterQu.text = "Org. Matter"
                       OrgMattterQu.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                       OrgMatterValue.text = "\(nutrients.first { $0.name == "Organic Matter" }?.value ?? .low)"
                
                
                
            }
        }
    func createDummySoilData() {
            // Define some dummy plants
            let plant1 = RecommendedPlant(name: "Rose", image: "rose_image")
            let plant2 = RecommendedPlant(name: "Tulip", image: "tulip_image")
            let plant3 = RecommendedPlant(name: "Lily", image: "lily_image")
            
            // Define nutrients
            let nitrogen = Nutrient(name: "Nitrogen", value: .high, quantity: "High")
            let phosphorus = Nutrient(name: "Phosphorus", value: .medium, quantity: "Medium")
            let potassium = Nutrient(name: "Potassium", value: .low, quantity: "Low")
            let organicMatter = Nutrient(name: "Organic Matter", value: .high, quantity: "High")
            
            // Create a soil scan
        let soilScan = SoilScane(
                id: UUID(),
                image: "soil",
                name: "Loamy Soil",
                description: """
                Loamy soil is a rich and fertile soil that is ideal for growing most plants. 
                It has a balanced texture and holds nutrients well. 
                This soil type is a mixture of sand, silt, and clay, which provides good aeration and moisture retention. 
                Loamy soil promotes root growth and allows for excellent drainage, making it perfect for growing a wide variety of plants, from flowers to vegetables. 
                The nutrient levels in loamy soil support healthy plant development, ensuring vibrant and thriving crops and plants.
                """,
                nutrients: [nitrogen, phosphorus, potassium, organicMatter],
                recommendedPlants: [plant1, plant2, plant3]
            )
            
            // Add the soil scan to the model
            SoilScanModel.shared.addSoilScan(soilScan: soilScan)
        }


}
