//
//  WaterCareTableViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 20/01/25.
//

import UIKit

class WaterCareTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PlnatImage: UIImageView!
    
    @IBOutlet weak var plnatName: UILabel!
    override func awakeFromNib() {
            super.awakeFromNib()
//            setupView()
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }

        // MARK: - Helper Methods
        func configureCell(with plant: PlantScan) {
            PlnatImage?.image = UIImage(named: plant.image)  // Ensure plant.image matches the asset name
            plnatName?.text = plant.name  // Ensure plant.name is correctly set
        }

        
    }
