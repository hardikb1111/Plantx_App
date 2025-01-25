//
//  myPlantDetailsViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit

class myPlantDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var detailsTabelView: UITableView!
    
    
    @IBOutlet weak var plantImage: UIImageView!
    
    @IBOutlet weak var plantNmae: UILabel!
    
    @IBOutlet weak var plantDisc: UITextView!
    
    @IBOutlet weak var sn: UILabel!
    
    @IBOutlet weak var scintificName: UILabel!
    
    
    
    var plantDetails: PlantScan?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set data for UI components
            if let plant = plantDetails {
                plantImage.image = UIImage(named: plant.image) // Set image
                plantNmae.text = plant.name
                plantDisc.text = plant.description
                sn.text = "Scintific Name"
                sn.widthAnchor.constraint(equalToConstant: 100).isActive = true
                scintificName.text = plant.scientificName
            }
            
            // Setup table view
            detailsTabelView.dataSource = self
            detailsTabelView.delegate = self
            detailsTabelView.reloadData()
        }
        
        // MARK: - UITableViewDataSource Methods
        func numberOfSections(in tableView: UITableView) -> Int {
            return plantDetails?.careSections.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return plantDetails?.careSections[section].instructions.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return plantDetails?.careSections[section].title
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CareInstructionCell", for: indexPath)
            
            if let careSection = plantDetails?.careSections[indexPath.section] {
                cell.textLabel?.text = careSection.instructions[indexPath.row]
            }
            
            return cell
        }
    }
