//
//  allmyplantsCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit

class allmyplantsCollectionViewCell: UICollectionViewCell {
       static let identifier = "MyPlantsCell"
        
        private var plantImage: UIImageView!
        private var plantNameLabel: UILabel!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            // Configure plantImage
            plantImage = UIImageView(frame: CGRect(x: 10, y: 10, width: frame.width - 20, height: frame.height - 50))
            plantImage.contentMode = .scaleAspectFill
            plantImage.clipsToBounds = true
            plantImage.layer.cornerRadius = 10
            plantImage.layer.masksToBounds = true
            contentView.addSubview(plantImage)
            
            // Configure plantNameLabel
            plantNameLabel = UILabel(frame: CGRect(x: 10, y: frame.height - 35, width: frame.width - 20, height: 25))
            plantNameLabel.textAlignment = .center
            plantNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
            plantNameLabel.textColor = .darkGray
            contentView.addSubview(plantNameLabel)
            
            // Configure contentView for shadow effect
            contentView.layer.cornerRadius = 12
            contentView.layer.shadowColor = UIColor.black.cgColor
            contentView.layer.shadowOpacity = 0.2
            contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
            contentView.layer.shadowRadius = 4
            contentView.backgroundColor = .white
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(with plant: PlantScan) {
            plantImage.image = UIImage(named: plant.image)
            plantNameLabel.text = plant.name
        }
    }

