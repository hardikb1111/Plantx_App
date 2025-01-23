//
//  wetherCellCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit

class wetherCellCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
       
       // Add the View All button
       let viewAllButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("View All", for: .normal)
           return button
       }()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           
           // Setup imageView
           imageView.contentMode = .center
           imageView.clipsToBounds = true
           contentView.addSubview(imageView)
           imageView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
               imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
               imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
               imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
           ])
           
           // Add View All button to content view
           contentView.addSubview(viewAllButton)
           viewAllButton.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               viewAllButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
               viewAllButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
               viewAllButton.heightAnchor.constraint(equalToConstant: 40)
           ])
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
   }
