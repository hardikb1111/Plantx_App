//
//  soilPlantRec.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 25/01/25.
//

import UIKit

class soilPlantRec: UICollectionViewCell {
    
    static let identifier = "soilBasedPlantCell"
        
    // MARK: - UI Elements
        private let plantImage: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 10
            return imageView
        }()
        
        private let plantNameLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.textColor = .black
            label.numberOfLines = 2
            return label
        }()
        
        // MARK: - Initializer
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            // Add subviews
            contentView.addSubview(plantImage)
            contentView.addSubview(plantNameLabel)
            
            // Style the card-like appearance
            contentView.layer.cornerRadius = 10
            contentView.backgroundColor = .white
            contentView.layer.shadowColor = UIColor.black.cgColor
            contentView.layer.shadowOpacity = 0.1
            contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
            contentView.layer.shadowRadius = 4
            contentView.clipsToBounds = false // Ensures shadow is visible
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Layout Subviews
        override func layoutSubviews() {
            super.layoutSubviews()
            
            // Layout for image and label
            let imageHeight = contentView.frame.height * 0.75
            plantImage.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: imageHeight)
            plantNameLabel.frame = CGRect(x: 5, y: imageHeight, width: contentView.frame.width - 10, height: contentView.frame.height - imageHeight)
        }
        
        // MARK: - Configure Cell
    func configure(with plant: RecommendedPlant) {
            plantImage.image = UIImage(named: plant.image)
            plantNameLabel.text = plant.name
        }
    }


