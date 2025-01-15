//
//  myPlantsCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by Harshit Malik on 18/12/24.
//

import UIKit

class myPlantsCollectionViewCell: UICollectionViewCell {

    
//    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var plant_name: UILabel!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            
            // Initialize UILabel and UIImageView programmatically
//            plantName_Label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
//            speciesName_label = UILabel(frame: CGRect(x: 0, y: 30, width: 100, height: 20))
//            plantImage = UIImageView(frame: CGRect(x: 0, y: 60, width: 100, height: 100))
//            
//            addSubview(plantName_Label)
//            addSubview(speciesName_label)
//            addSubview(plantImage)
        
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    }
    
    

