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
            
            // Title for the soil scan result
            soilLbl.text = "Hurray, we identified the Soil!"
            
            // Fetch the first soil scan from the shared model
            if let soilScan = SoilScanModel.shared.getAllSoilScans().first {
                updateUI(with: soilScan)
            }
        }
        
        private func updateUI(with soilScan: SoilScane) {
            // Update soil image and details
            soilImg.image = UIImage(named: soilScan.image)
            soillName.text = soilScan.name
            tsoilTxt.text = soilScan.description
            
            // Update nutrient values
            updateNutrientUI(for: soilScan.nutrients, nutrientName: "Nitrogen", quantityLabel: NitroQuantity, valueLabel: NitroValue)
            updateNutrientUI(for: soilScan.nutrients, nutrientName: "Phosphorus", quantityLabel: PhosQuantity, valueLabel: PhosValue)
            updateNutrientUI(for: soilScan.nutrients, nutrientName: "Potassium", quantityLabel: PotaQuantity, valueLabel: PotaValue)
            updateNutrientUI(for: soilScan.nutrients, nutrientName: "Organic Matter", quantityLabel: OrgMattterQu, valueLabel: OrgMatterValue)
        }
        
        private func updateNutrientUI(for nutrients: [Nutrient], nutrientName: String, quantityLabel: UILabel, valueLabel: UILabel) {
            if let nutrient = nutrients.first(where: { $0.name == nutrientName }) {
                quantityLabel.text = nutrient.name
                quantityLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                valueLabel.text = "\(nutrient.value)"
            } else {
                quantityLabel.text = nutrientName
                valueLabel.text = "Not Available"
            }
        }
    }
