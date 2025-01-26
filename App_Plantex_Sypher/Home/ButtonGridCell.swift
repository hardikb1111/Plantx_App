//
//  ButtonGridCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 26/01/25.
//

import UIKit

class ButtonGridCell: UICollectionViewCell {
    
    private let button: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemGreen
            button.setTitle("", for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.clipsToBounds = true
            button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            return button
        }()
        
        var buttonAction: (() -> Void)?
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.layer.cornerRadius = 16
            contentView.layer.masksToBounds = true
            contentView.backgroundColor = .white
            
            // Add a shadow for better aesthetics (optional)
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.2
            layer.shadowOffset = CGSize(width: 2, height: 2)
            layer.shadowRadius = 4
            layer.masksToBounds = false
            
            contentView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: contentView.topAnchor),
                button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
            
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // Modify the configure method to accept an action closure
        func configure(with image: UIImage?, action: @escaping () -> Void) {
            button.setImage(image, for: .normal)
            self.buttonAction = action
        }
        
        @objc private func buttonTapped() {
            buttonAction?() 
        }
}
