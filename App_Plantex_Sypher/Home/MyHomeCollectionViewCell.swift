//
//  MyplantsCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 19/01/25.
//

//import UIKit
//
//class MyHomeCollectionViewCell: UICollectionViewCell {
//    static let identifier = "MyplantsCollectionViewCell"
//    private var imageView : UIImageView {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }
//    override init(frame : CGRect){
//        super.init(frame : frame)
//        contentView.addSubview(imageView)
//        let images: [UIImage] = [
//            UIImage(named : "Alovera")
//        ].compactMap ({ $0 })
//        imageView.image = images.randomElement()
//        contentView.clipsToBounds = true
//    }
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        imageView.frame = contentView.bounds
//    }
//    
//}
import UIKit

class MyHomeCollectionViewCell: UICollectionViewCell {

    
    var plantImage: UIImageView!
        var PlantName: UILabel!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
          
            plantImage = UIImageView(frame: CGRect(x: 10, y: 10, width: frame.width - 20, height: frame.height - 40))
            PlantName = UILabel(frame: CGRect(x: 10, y: frame.height - 30, width: frame.width - 20, height: 20))
            
       
            plantImage.contentMode = .scaleAspectFill
            PlantName.textAlignment = .center
            
            
            contentView.addSubview(plantImage)
            contentView.addSubview(PlantName)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(with plant: PlantScan) {
           
            plantImage.image = UIImage(named: plant.image)
            PlantName.text = plant.name
        }
    }
