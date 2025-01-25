//
//  RemenderViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 24/01/25.
//

import UIKit

class RemenderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var RemenderView: UITableView!
    
    // Data for the checkboxes
        let labels = ["Option 1", "Option 2", "Option 3"]
        var selectedStates = [Bool]() // Track checkbox states

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Initialize checkbox states
            selectedStates = Array(repeating: false, count: labels.count)
            
            // Set Delegate and DataSource
            RemenderView.delegate = self
            RemenderView.dataSource = self
        }

        // MARK: - UITableView DataSource
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2 // Two sections
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return section == 0 ? 1 : labels.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                // Date Picker Section
                let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell", for: indexPath) as! DatePickerTableViewCell
                return cell
            } else {
                // Checkbox Section
                let cell = tableView.dequeueReusableCell(withIdentifier: "CheckboxCell", for: indexPath) as! CheckboxTableViewCell
                cell.CareTips.text = labels[indexPath.row]
                cell.CheckBox.isSelected = selectedStates[indexPath.row]
                cell.CheckBox.tag = indexPath.row
                cell.CheckBox.addTarget(self, action: #selector(toggleCheckbox(_:)), for: .touchUpInside)
                return cell
            }
        }

        // MARK: - UITableView Delegate
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return indexPath.section == 0 ? 600 : 50
//        }

   
    @IBAction func toggleCheckbox(_ sender: UIButton) {
        print("call")
        sender.isSelected.toggle()
        selectedStates[sender.tag] = sender.isSelected
        
    }
    

}
