//
//  CheckboxTableViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 24/01/25.
//

import UIKit

class CheckboxTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CheckBox: UIButton!
    
    @IBOutlet weak var CareTips: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
