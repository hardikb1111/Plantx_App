//
//  recomendedPlantCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 16/01/25.
//

import UIKit

class recomendedPlantCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var plantImg: UIImageView!
    @IBOutlet weak var plantName: UILabel!
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            // Customize the image view
            plantImg.contentMode = .scaleAspectFill
            plantImg.layer.cornerRadius = 10
            plantImg.clipsToBounds = true
            
            // Customize the label
            plantName.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            plantName.textColor = .darkGray
            plantName.textAlignment = .center
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            
            // Reset content to prevent incorrect reuse
            plantImg.image = nil
            plantName.text = nil
        }
    
}
