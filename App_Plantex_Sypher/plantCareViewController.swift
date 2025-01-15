//
//  plantCareViewController.swift
//  App_Plantex_Sypher
//
//  Created by Harshit Malik on 14/01/25.
//

import UIKit

struct Plant {
    let image: UIImage
    let name: String
    let isHealthy: Bool
}

class plantCareViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var healthyButton: UIButton!
    
    
    @IBOutlet weak var unHealthyButton: UIButton!
    
    let plantCareData: [Plant] = [
        Plant(image: UIImage(named: "plant1") ?? UIImage(systemName: "leaf")!, name: "Fern", isHealthy: true),
        Plant(image: UIImage(named: "plant2") ?? UIImage(systemName: "leaf")!, name: "Snake Plant", isHealthy: true),
        Plant(image: UIImage(named: "plant3") ?? UIImage(systemName: "leaf")!, name: "Orchid", isHealthy: false),
        Plant(image: UIImage(named: "plant4") ?? UIImage(systemName: "leaf")!, name: "Peace Lily", isHealthy: true),
        Plant(image: UIImage(named: "plant1") ?? UIImage(systemName: "leaf")!, name: "Aloe Vera", isHealthy: true),
        
        Plant(image: UIImage(named: "plant4") ?? UIImage(systemName: "leaf")!, name: "Peace Lily", isHealthy: false),
        Plant(image: UIImage(named: "plant1") ?? UIImage(systemName: "leaf")!, name: "Aloe Vera", isHealthy: false)
    ]

    var filteredData: [Plant] = []
    override func viewDidLoad() {
            super.viewDidLoad()
        helper()
            
            // Do any additional setup after loading the view.
            
            // Set the table view's delegate and data source
//        tableView.backgroundColor = UIColor.systemGray6
//                
//                
//        tableView.separatorStyle = .none
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 140
        
//        filteredData = plantCareData
            
        }
    
    func helper()
    {
        print("call come")
        filteredData = plantCareData.filter { $0.isHealthy }
        tableView.reloadData()
//        healthyButton.backgroundColor = .green
        healthyButton.tintColor = .green
//        unHealthyButton.backgroundColor = .black
        unHealthyButton.tintColor = .lightGray
        
    }
    
    @IBAction func helathyButtonAct(_ sender: UIButton) {
        helper()
    }
    
    @IBAction func unHealthyButtonAct(_ sender: UIButton) {
        filteredData = plantCareData.filter { !$0.isHealthy }
                tableView.reloadData()
        healthyButton.tintColor = .lightGray
//        unHealthyButton.backgroundColor = .red
        unHealthyButton.tintColor = .red

        
    }
    
    
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlantCare", for: indexPath) as? plantCareTableViewCell
                    
                    // Get the corresponding plant data
            let plant = filteredData[indexPath.row]
                
                // Configure the cell
            cell?.plantImage.image = plant.image
            cell?.plantName.text = plant.name
            cell?.plantGroath.text = plant.isHealthy ? "Healthy" : "Not Healthy"
            cell?.plantGroath.textColor = plant.isHealthy ? .systemGreen : .systemRed
            
           
                
            return cell!
        }
    
//        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 20
//        }
//        
//        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let spacerView = UIView()
//            spacerView.backgroundColor = .clear
//            return spacerView
//        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Handle cell selection here
            let selectedPlant = filteredData[indexPath.row]
                    print("Selected Plant: \(selectedPlant.name), Health Status: \(selectedPlant.isHealthy ? "Healthy" : "Not Healthy")")
        }
    

}
