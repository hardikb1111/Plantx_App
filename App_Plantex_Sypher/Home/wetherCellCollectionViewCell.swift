//
//  wetherCellCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit

class wetherCellCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
           
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            // Setup imageView
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            contentView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                // Set the image width and height explicitly
                imageView.widthAnchor.constraint(equalToConstant: 360),
                imageView.heightAnchor.constraint(equalToConstant: 170),
                
                // Center the image in the cell (optional)
                imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
   
