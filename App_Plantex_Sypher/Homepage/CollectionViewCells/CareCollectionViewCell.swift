//
//  CareCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 22/01/25.
//

import UIKit

class CareCollectionViewCell: AnyObject {
    func didTapButton(in cell: CareCollectionViewCell){
        
    }
}
weak var button: UIButton!


    class ImageButtonCell: UICollectionViewCell {
        static let identifier = "CareCollectionViewCell"
        

        
        weak var delegate: CareCollectionViewCell?
        
        func configure(with image: UIImage?) {
            button.setImage(image, for: .normal)
        }
        
//        @IBAction func buttonAction(_ sender: UIButton) {
//            delegate?.didTapButton(in: self) // Notify the delegate
//        }
    }

