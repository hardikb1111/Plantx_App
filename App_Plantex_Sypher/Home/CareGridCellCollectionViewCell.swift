//
//  CareGridCellCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit
protocol CareGridCellDelegate: AnyObject {
    func didTapCareButton(title: String)
}

class CareGridCellCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: CareGridCellDelegate?
    
    let nestedCollectionView: UICollectionView
    let images = ["img1", "img2", "img3", "img4", "img5", "img6"]
    let titles = ["Watering", "Sunlight", "Fertilizing", "Repotting", "Pruning", "Pests"] 

        override init(frame: CGRect) {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            nestedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            super.init(frame: frame)

            nestedCollectionView.delegate = self
            nestedCollectionView.dataSource = self
            nestedCollectionView.register(ButtonGridCell.self, forCellWithReuseIdentifier: "GridItem") 
                   contentView.addSubview(nestedCollectionView)
            nestedCollectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                nestedCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
                nestedCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                nestedCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                nestedCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridItem", for: indexPath) as? ButtonGridCell else {
                        fatalError("Unable to dequeue ButtonGridCell")
                    }
                    
                    let title = titles[indexPath.item]
                    cell.configure(with: UIImage(named: "img\(indexPath.item + 1)")!) {
                        self.delegate?.didTapCareButton(title: title)
                    }
                    return cell
        }


    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Adjust cell size to account for margins
            let width = (collectionView.frame.width - 32 - 20) / 3 
            return CGSize(width: width, height: width)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            // Add 16pt padding on left and right
            return UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        }
    
   

    }
    
   
