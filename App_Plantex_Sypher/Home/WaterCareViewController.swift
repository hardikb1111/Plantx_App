//
//  WaterCareViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 20/01/25.
//

import UIKit

class WaterCareViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var waterCare: UITableView!
    
    
    
    
    var data: [PlantScan] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Setup the data
            data = PlantScanModel.shared.generateDummyData()
            
            // Setup tableView
            waterCare.dataSource = self
            waterCare.delegate = self
            
            // Register the custom cell
            waterCare.register(WaterCareTableViewCell.self, forCellReuseIdentifier: "WaterCareCell")
        }
        
        // MARK: - UITableViewDataSource Methods
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WaterCareCell", for: indexPath) as? WaterCareTableViewCell else {
                return UITableViewCell()
            }
            
            let plant = data[indexPath.row]
            
            // Configure the custom cell
            cell.configureCell(with: plant)  
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120 // Set the height of the cell as per your requirement
        }
        
        // MARK: - UITableViewDelegate Methods
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedPlant = data[indexPath.row]
            print("Selected plant: \(selectedPlant.name)")
            tableView.deselectRow(at: indexPath, animated: true)
            print(selectedPlant.image)
        }
    }
