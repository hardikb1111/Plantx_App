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
        
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func addRemender(_ sender: Any) {
    }
    
}
