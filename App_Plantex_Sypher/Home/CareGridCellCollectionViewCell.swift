//
//  CareGridCellCollectionViewCell.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit

class CareGridCellCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let nestedCollectionView: UICollectionView

        override init(frame: CGRect) {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            nestedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            super.init(frame: frame)

            nestedCollectionView.delegate = self
            nestedCollectionView.dataSource = self
            nestedCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "GridItem")
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridItem", for: indexPath)
            cell.backgroundColor = .systemGreen
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.frame.width - 20) / 3 
            return CGSize(width: width, height: width)
        }
    }
    

