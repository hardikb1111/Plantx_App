//
//  CareButton.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 26/01/25.
//

import UIKit

class CareButton: UIViewController, UITableViewDataSource, CareGridCellDelegate {
 
    @IBOutlet weak var CareName: UILabel!
    
    @IBOutlet weak var TblView: UITableView!
    
    var selectedCareTitle: String?
        var care: [CareSection] = []
            
        // Variable to hold filtered care section details
        var selectedCareSection: CareSection?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            print("CareButton view controller loaded")
            
            if TblView == nil {
                print("TblView is nil")
            } else {
                print("TblView is connected")
            }
            
            // Load care sections from the model
            care = CareSectionModel.shared.getCareSections()
            
            TblView.register(CareButtonTableViewCell.self, forCellReuseIdentifier: "CareCell")
            TblView.dataSource = self
            
            // If a title is selected, fetch and display the instructions
            if let selectedCareTitle = selectedCareTitle {
                displayCareInstructions(for: selectedCareTitle)
            }
        }
        
        // This function handles the tap on care button from another view (e.g., CareGridCellCollectionViewCell)
        func didTapCareButton(title: String) {
            let careButtonVC = CareButton()
            careButtonVC.selectedCareTitle = title
            navigationController?.pushViewController(careButtonVC, animated: true)
        }
        
        // Display care instructions for the selected care section
        func displayCareInstructions(for title: String) {
            // Safely find the care section that matches the title
            if let careSection = care.first(where: { $0.title == title }) {
                CareName.text = careSection.title
                selectedCareSection = careSection
                TblView.reloadData()  // Reload the table to display updated information
            } else {
                print("Error: Care section not found for title \(title)")
            }
        }
        
        // TableView Data Source Methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Safely return the number of instructions if available
            return selectedCareSection?.instructions.count ?? 1 // Fallback if no instructions
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CareCell", for: indexPath) as? CareButtonTableViewCell else {
                       return UITableViewCell()  // Fallback in case of failure
                   }
                   
                   if let careSection = selectedCareSection, !careSection.instructions.isEmpty {
                       let instruction = careSection.instructions[indexPath.row]
                       
                       // Providing a default image and plant name
                       let defaultImage = UIImage(named: "") ?? UIImage() // Make sure you have a default image in your assets
                       let defaultPlantName = "Default Plant"
                       
                       // Pass data to the custom cell
                       cell.configure(with: instruction, image: defaultImage, plantName: defaultPlantName)
                   } else {
                       cell.instructionLabel.text = "No instructions available"
                   }
                   
                   return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150 // Increase the height here as desired
        }
    }
