//
//  mainHomeViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 20/01/25.
//

import UIKit

class mainHomeViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var homeCollectionsView: UICollectionView!
    
    var plants: [PlantScan] = []
           
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Retrieve plants data
           plants = HomeModel.shared.getPlants()
           
           // Set up collection view
           setupCollectionView()
       }
       
       private func setupCollectionView() {
           homeCollectionsView.dataSource = self
           homeCollectionsView.delegate = self
           
           // Register custom cell
           homeCollectionsView.register(MyHomeCollectionViewCell.self, forCellWithReuseIdentifier: "PlantCell")
       }
       
       // MARK: - UICollectionViewDataSource
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 2
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            // Ensure you're using the correct cell class name
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlantCell", for: indexPath) as? MyHomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let plant = plants[indexPath.item]
            cell.configure(with: plant)
            
            return cell
        }
       
       // MARK: - UICollectionViewDelegateFlowLayout
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let width = (collectionView.frame.width - 20) / 2 // Two items per row with spacing
           return CGSize(width: width, height: width * 1.5) // Adjust height ratio as needed
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }
}
