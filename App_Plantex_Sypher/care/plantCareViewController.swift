//
//  plantCareViewController.swift
//  App_Plantex_Sypher
//
//  Created by Harshit Malik on 14/01/25.
//

import UIKit



class plantCareViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var healthyButton: UIButton!
    
    
    @IBOutlet weak var unHealthyButton: UIButton!
    
    var plantCareData: [PlantHealth] = []

    var filteredData: [PlantHealth] = []
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            setupView()
            loadData()
        }
        
        // MARK: - Setup
        private func setupView() {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 140
            updateFilter(isHealthy: true)
        }
        
        private func loadData() {
            plantCareData = PlantCareModel.shared.getAllPlants()
            updateFilter(isHealthy: true)
        }
    
    
    @IBAction func helathyButtonAct(_ sender: UIButton) {
        updateFilter(isHealthy: true)
    }
    
    @IBAction func unHealthyButtonAct(_ sender: UIButton) {
        updateFilter(isHealthy: false)

        
    }
    
    private func updateFilter(isHealthy: Bool) {
            filteredData = plantCareData.filter { $0.isHealthy == isHealthy }
            tableView.reloadData()
            
            // Update button styles
            healthyButton.tintColor = isHealthy ? .systemGreen : .lightGray
            unHealthyButton.tintColor = isHealthy ? .lightGray : .systemRed
        }
        
        // MARK: - UITableViewDataSource
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlantCare", for: indexPath) as? plantCareTableViewCell else {
                fatalError("Cell identifier 'PlantCare' not found or cell is not of type PlantCareTableViewCell.")
            }
            
            // Configure the cell
            let plant = filteredData[indexPath.row]
            cell.plantImage.image = plant.image
            cell.plantName.text = plant.name
            cell.plantGroath.text = plant.isHealthy ? "Healthy" : "Not Healthy"
            cell.plantGroath.textColor = plant.isHealthy ? .systemGreen : .systemRed
            
            return cell
        }
        
        // MARK: - UITableViewDelegate
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedPlant = filteredData[indexPath.row]
            print("Selected Plant: \(selectedPlant.name), Health Status: \(selectedPlant.isHealthy ? "Healthy" : "Not Healthy")")
        }
    
    @IBAction func DeletePlant(_ sender: Any) {
        print("call")
        let alertController = UIAlertController(title: "Delete Plant", message: "Enter the name of the plant you want to delete", preferredStyle: .alert)
                
                alertController.addTextField { textField in
                    textField.placeholder = "Plant Name"
                }
                
                let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                    if let plantName = alertController.textFields?.first?.text, !plantName.isEmpty {
                        self.deletePlantByName(plantName)
                    }
                }
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alertController.addAction(deleteAction)
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
    }
    private func deletePlantByName(_ name: String) {
            if let index = plantCareData.firstIndex(where: { $0.name.lowercased() == name.lowercased() }) {
                // Remove from both plantCareData and filteredData
                plantCareData.remove(at: index)
                filteredData.remove(at: index)

                // Reload table view after deletion
                tableView.reloadData()

                // Show alert for successful deletion
                let successAlert = UIAlertController(title: "Success", message: "The plant '\(name)' has been successfully deleted.", preferredStyle: .alert)
                successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(successAlert, animated: true, completion: nil)
            } else {
                // If no plant is found with that name
                let errorAlert = UIAlertController(title: "Error", message: "No plant found with the name '\(name)'.", preferredStyle: .alert)
                errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(errorAlert, animated: true, completion: nil)
            }
        }
    
    }
