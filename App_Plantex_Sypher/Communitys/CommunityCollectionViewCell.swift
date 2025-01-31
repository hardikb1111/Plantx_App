//
//  CommunityCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 24/01/25.
//

import UIKit

class CommunityCollectionViewCell: UICollectionViewCell {
    
       static let identifier = "CommunityPostCell"
    
   
        
        private var profileImageView: UIImageView!
        private var userNameLabel: UILabel!
        private var dateLabel: UILabel!
        private var plantImageView: UIImageView!
        private var postDescriptionLabel: UILabel!
        private var likesLabel: UILabel!
        private var commentsLabel: UILabel!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            // Configure profileImageView
            profileImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
            profileImageView.layer.cornerRadius = 20
            profileImageView.clipsToBounds = true
            contentView.addSubview(profileImageView)
            
            // Configure userNameLabel
            userNameLabel = UILabel(frame: CGRect(x: 60, y: 10, width: frame.width - 70, height: 20))
            userNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
            userNameLabel.textColor = .darkGray
            contentView.addSubview(userNameLabel)
            
            // Configure dateLabel
            dateLabel = UILabel(frame: CGRect(x: 60, y: 30, width: frame.width - 70, height: 15))
            dateLabel.font = UIFont.systemFont(ofSize: 12)
            dateLabel.textColor = .lightGray
            contentView.addSubview(dateLabel)
            
            // Configure plantImageView
            plantImageView = UIImageView(frame: CGRect(x: 10, y: 60, width: frame.width - 20, height: frame.height - 160))
            plantImageView.contentMode = .scaleAspectFill
            plantImageView.layer.cornerRadius = 10
            plantImageView.clipsToBounds = true
            contentView.addSubview(plantImageView)
            
            // Configure postDescriptionLabel
            postDescriptionLabel = UILabel(frame: CGRect(x: 10, y: frame.height - 90, width: frame.width - 20, height: 40))
            postDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
            postDescriptionLabel.textColor = .darkGray
            postDescriptionLabel.numberOfLines = 2
            postDescriptionLabel.textAlignment = .center
            contentView.addSubview(postDescriptionLabel)
            
            // Likes Label
            likesLabel = UILabel(frame: CGRect(x: 10, y: frame.height - 40, width: 100, height: 20))
            likesLabel.font = UIFont.systemFont(ofSize: 14)
            likesLabel.textColor = .black
            likesLabel.text = "0 Likes"
            contentView.addSubview(likesLabel)
            
            // Comments Label
            commentsLabel = UILabel(frame: CGRect(x: 120, y: frame.height - 40, width: 150, height: 20))
            commentsLabel.font = UIFont.systemFont(ofSize: 14)
            commentsLabel.textColor = .black
            commentsLabel.text = "0 Comments"
            contentView.addSubview(commentsLabel)
            
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
        
    func configure(with post: CommunityPost) {
//        if let profileImage = fetchImageFromDocumentsDirectory(imageName: post.profileImage) {
//            profileImageView.image = profileImage
//        } else {
//            profileImageView.image = UIImage(named: post.profileImage)
//        }
        profileImageView.image = UIImage(named: "Profile")
        
        userNameLabel.text = post.userName
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let formattedDate = dateFormatter.string(from: post.time)
        dateLabel.text = formattedDate
        
        if let plantImage = fetchImageFromDocumentsDirectory(imageName: post.plantImage) {
            plantImageView.image = plantImage
        } else {
            plantImageView.image = UIImage(named: post.plantImage)
        }
        
       
        postDescriptionLabel.text = post.comment
        likesLabel.text = "\(post.likes) Likes"
        commentsLabel.text = "0 Comments"
    }
    func fetchImageFromDocumentsDirectory(imageName: String) -> UIImage? {
        let fileManager = FileManager.default
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath = documentDirectory.appendingPathComponent(imageName)
            return UIImage(contentsOfFile: filePath.path)
        }
        return nil
    }


    }
