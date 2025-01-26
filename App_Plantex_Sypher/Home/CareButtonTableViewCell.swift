//
//  CareButtonTableViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 26/01/25.
//

import UIKit

class CareButtonTableViewCell: UITableViewCell {

   var instructionLabel: UILabel!
        var plantImageView: UIImageView!
        var plantNameLabel: UILabel!
            
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            // Initialize labels and image view
            instructionLabel = UILabel()
            instructionLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(instructionLabel)
            
            plantImageView = UIImageView()
            plantImageView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(plantImageView)
            
            plantNameLabel = UILabel()
            plantNameLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(plantNameLabel)
            
            // Add constraints to position the label and image view within the cell
            NSLayoutConstraint.activate([
                plantImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                plantImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                plantImageView.widthAnchor.constraint(equalToConstant: 60), // Increase image size if necessary
                plantImageView.heightAnchor.constraint(equalToConstant: 60),
                
                plantNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                plantNameLabel.leadingAnchor.constraint(equalTo: plantImageView.trailingAnchor, constant: 10),
                plantNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                
                instructionLabel.topAnchor.constraint(equalTo: plantNameLabel.bottomAnchor, constant: 10), // Adjust the spacing here
                instructionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                instructionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                instructionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
            
            // Optional: Customize label and image view style
            instructionLabel.numberOfLines = 0
            instructionLabel.font = UIFont.systemFont(ofSize: 16)
            plantNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
            
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
            
        // Configure method to set the instruction text, image, and plant name
        func configure(with instruction: String, image: UIImage, plantName: String) {
            instructionLabel.text = instruction
            plantImageView.image = image
            plantNameLabel.text = plantName
        }
    }
