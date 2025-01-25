//
//  nearByShopTableViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 20/01/25.
//

import UIKit

class nearByShopTableViewCell: UITableViewCell {
    // UI elements for the card design
        var locationImage: UIImageView!
        var shopNameLabel: UILabel!
        var distance: UILabel!
        var timeTaken: UILabel!
        var getMapButton: UIButton!  // New button for "Get Map"
        
        // Initializer
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupCell()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupCell()
        }
        
        // Method to set up the cell and add the UI elements
        private func setupCell() {
            // Content View Configuration
            self.contentView.layer.cornerRadius = 10
            self.contentView.layer.masksToBounds = true
            self.contentView.layer.shadowColor = UIColor.black.cgColor
            self.contentView.layer.shadowOpacity = 0.1
            self.contentView.layer.shadowRadius = 5
            self.contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
            
            // Setup the location image view
            locationImage = UIImageView()
            locationImage.translatesAutoresizingMaskIntoConstraints = false
            locationImage.contentMode = .scaleAspectFill
            locationImage.layer.cornerRadius = 25
            locationImage.clipsToBounds = true
            self.contentView.addSubview(locationImage)
            
            // Setup the shop name label
            shopNameLabel = UILabel()
            shopNameLabel.translatesAutoresizingMaskIntoConstraints = false
            shopNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
            shopNameLabel.textColor = .black
            self.contentView.addSubview(shopNameLabel)
            
            // Setup the distance label
            distance = UILabel()
            distance.translatesAutoresizingMaskIntoConstraints = false
            distance.font = UIFont.systemFont(ofSize: 14)
            distance.textColor = .darkGray
            self.contentView.addSubview(distance)
            
            // Setup the timeTaken label
            timeTaken = UILabel()
            timeTaken.translatesAutoresizingMaskIntoConstraints = false
            timeTaken.font = UIFont.systemFont(ofSize: 14)
            timeTaken.textColor = .darkGray
            self.contentView.addSubview(timeTaken)
            
            // Setup the "Get Map" button
            getMapButton = UIButton()
            getMapButton.translatesAutoresizingMaskIntoConstraints = false
            getMapButton.setTitle("Map ->", for: .normal)
            getMapButton.backgroundColor = .systemGreen
            getMapButton.layer.cornerRadius = 5
            getMapButton.setTitleColor(.white, for: .normal)
            getMapButton.addTarget(self, action: #selector(didTapGetMap), for: .touchUpInside)
            self.contentView.addSubview(getMapButton)
            
            // Add constraints to position the elements in the cell
            NSLayoutConstraint.activate([
                locationImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
                locationImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
                locationImage.widthAnchor.constraint(equalToConstant: 50),
                locationImage.heightAnchor.constraint(equalToConstant: 50),
                
                shopNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
                shopNameLabel.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 10),
                shopNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
                
                distance.topAnchor.constraint(equalTo: shopNameLabel.bottomAnchor, constant: 5),
                distance.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 10),
                distance.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
                
                timeTaken.topAnchor.constraint(equalTo: distance.bottomAnchor, constant: 5),
                timeTaken.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 10),
                timeTaken.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
                timeTaken.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -50),
                
                getMapButton.topAnchor.constraint(equalTo: timeTaken.bottomAnchor, constant: 10),
                getMapButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
                getMapButton.widthAnchor.constraint(equalToConstant: 100),
                getMapButton.heightAnchor.constraint(equalToConstant: 40),
                getMapButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
            ])
        }
        
        // Method to configure the cell with data
        func configure(with shop: Shop) {
            locationImage.image = UIImage(named: shop.image) ?? UIImage(named: "placeholderImage")
            shopNameLabel.text = shop.shopNameLabel
            distance.text = shop.distance
            timeTaken.text = shop.timeTaken
        }
        
        // Button action when tapped
        @objc private func didTapGetMap() {
            // Handle the action for "Get Map" button tap (e.g., navigate to map screen)
            print("Get Map tapped for \(shopNameLabel.text ?? "")")
        }
    }
