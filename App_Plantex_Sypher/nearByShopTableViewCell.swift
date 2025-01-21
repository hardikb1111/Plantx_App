//
//  nearByShopTableViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 20/01/25.
//

import UIKit

class nearByShopTableViewCell: UITableViewCell {

    @IBOutlet weak var locationImage: UIImageView!
    
    @IBOutlet weak var shopNameLabel: UILabel!
    
    @IBOutlet weak var distance: UILabel!
    
    @IBOutlet weak var timeTaken: UILabel!
    
    

    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            // Round the location image to make it circular
            locationImage.layer.cornerRadius = locationImage.frame.size.width / 2
            locationImage.clipsToBounds = true
            
            // Style for labels
            shopNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
            shopNameLabel.textColor = .black
            
            distance.font = UIFont.systemFont(ofSize: 14)
            distance.textColor = .darkGray
            
            timeTaken.font = UIFont.systemFont(ofSize: 14)
            timeTaken.textColor = .darkGray
        
        
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
            if selected {
                self.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
            } else {
                self.contentView.backgroundColor = .white
            }
        }
}
