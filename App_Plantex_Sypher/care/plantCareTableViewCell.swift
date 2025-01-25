//
//  plantCareTableViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 14/01/25.
//

import UIKit

class plantCareTableViewCell: UITableViewCell {

    @IBOutlet weak var plantImage: UIImageView!
    
    @IBOutlet weak var plantName: UILabel!
    
    
    @IBOutlet weak var plantGroath: UILabel!
    
    private let cardView = UIView()
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCardStyle()
        
    }
    
    private func setupCardStyle() {
            // Card view styling
            cardView.layer.cornerRadius = 12
            cardView.layer.shadowColor = UIColor.black.cgColor
            cardView.layer.shadowOpacity = 0.2
            cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
            cardView.layer.shadowRadius = 6
            cardView.layer.masksToBounds = false
            cardView.backgroundColor = UIColor.white

            // Plant image styling
            plantImage.layer.cornerRadius = 8
            plantImage.clipsToBounds = true
            plantImage.contentMode = .scaleAspectFill
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func addRemender(_ sender: Any) {
    }
    
}
