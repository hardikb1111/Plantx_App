//
//  DiseaseAnalysisViewController.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 31/12/24.
//

import UIKit

class DiseaseAnalysisViewController: UIViewController {
    
    @IBOutlet weak var diseaseImage: UIImageView!
    
    @IBOutlet weak var diseaseName: UILabel!
    
    @IBOutlet weak var scntificName: UILabel!
    
    @IBOutlet weak var scntificNamediff: UILabel!
    
    @IBOutlet weak var alsoKnownas: UILabel!
    
    @IBOutlet weak var diseaseNameValue: UILabel!
    
    @IBOutlet weak var scientificNameValue: UILabel!
    
    @IBOutlet weak var plantName: UILabel!
    
    @IBOutlet weak var diseaseDiscreption: UITextView!
    
    @IBOutlet weak var alsoKnownasValue: UILabel!
    
    
    
    
    
    let diseaseScanModel = DiseaseScanModel.shared


        override func viewDidLoad() {
            super.viewDidLoad()

            // Initialize dummy data
            initializeDummyData()

          
            if let disease = diseaseScanModel.getDiseaseScans().first {
                displayDisease(disease)
            }
        }
        
        private func initializeDummyData() {
            // Example chemicals
            let chemical1 = Chemical(name: "Chemical A", value: 10.5)
            let chemical2 = Chemical(name: "Chemical B", value: 5.2)
            let chemical3 = Chemical(name: "Chemical C", value: 8.8)

            // Example plant IDs
            let plant1ID = UUID()
            let plant2ID = UUID()

            // Adding diseases
            diseaseScanModel.addDisease(
                diseaseName: "Powdery Mildew",
                scientificName: "Erysiphales",
                alsoKnownAs: ["White Mold", "Oidium"],
                diseaseImage: "diseaseName",
                description: """
                Powdery Mildew is a common fungal disease causing white, powder-like spots on leaves, stems, and flowers. Thriving in humid, moderate climates with poor air circulation, it weakens plants, stunts growth, and reduces yields. Symptoms include leaf curling, yellowing, and distortion, often leading to premature leaf drop and lower productivity.
                """,
                symptoms: ["White spots on leaves", "Leaf discoloration"],
                solutions: [chemical1, chemical2],
                preventiveMeasures: ["Ensure good air circulation", "Avoid overhead watering"],
                plantIDs: [plant1ID]
            )

            
            
           
        }
        
        private func displayDisease(_ disease: Disease) {
            // Update UI elements with disease data
            plantName.text = disease.diseaseName
            diseaseName.text = "Disease Name  :"
            diseaseNameValue.text = disease.diseaseName
            scntificName.text = "Scientific Name :"
            scientificNameValue.text = disease.scintificName
            diseaseDiscreption.text = disease.description
            alsoKnownas.text = "Also Known as :"
            alsoKnownasValue.text = disease.alsoKnownAs.joined(separator: ", ");

            // Load disease image (assuming local images for now)
            if let image = UIImage(named: disease.diseaseImage) {
                diseaseImage.image = image
            }
        }
    
    
    @IBAction func SaveButton(_ sender: Any) {
        let alert = UIAlertController(title: "Disease Saved",
                                          message: "The disease has been successfully saved to the care section.",
                                          preferredStyle: .alert)
           
           // Add an "OK" action to dismiss the alert
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           
           // Present the alert
           self.present(alert, animated: true, completion: nil)
           
           
//           if let disease = diseaseScanModel.getDiseaseScans().first {
//               diseaseScanModel.saveDiseaseToCareSection(disease)
//               print("Disease \(disease.diseaseName) saved to care section.")
//           }
        
        
    }
    
    }
