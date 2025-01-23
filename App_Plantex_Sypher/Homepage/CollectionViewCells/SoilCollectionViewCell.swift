//
//  SoilCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 23/01/25.
//

import UIKit

class SoilCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecommendedSoilCell"
        
    private var soilImage: UIImageView!
    private var soilName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configure plantImage
        soilImage = UIImageView(frame: CGRect(x: 10, y: 10, width: frame.width - 20, height: frame.height - 50))
        soilImage.contentMode = .scaleAspectFill
        soilImage.clipsToBounds = true
        soilImage.layer.cornerRadius = 10
        soilImage.layer.masksToBounds = true
        contentView.addSubview(soilImage)
        
        // Configure plantNameLabel
        soilName = UILabel(frame: CGRect(x: 10, y: frame.height - 35, width: frame.width - 20, height: 25))
        soilName.textAlignment = .center
        soilName.font = UIFont.boldSystemFont(ofSize: 16)
        soilName.textColor = .darkGray
        contentView.addSubview(soilName)
        
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
    
    func configure(with soil: SoilScane) {
        soilImage.image = UIImage(named: soil.image)
        soilName.text = soil.name
    }
}

