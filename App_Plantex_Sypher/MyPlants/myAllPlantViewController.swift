//
//  myAllPlantViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 22/01/25.
//

import UIKit

class myAllPlantViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var myPlants: UICollectionView!
    
    var plants: [PlantScan] = []
        
        // MARK: - Lifecycle Methods
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Initialize dummy data
            plants = PlantScanModel.shared.generateDummyData()
            
            // Setup collection view
            setupCollectionView()
        }
        
        private func setupCollectionView() {
            myPlants.dataSource = self
            myPlants.delegate = self
            
            // Register custom cell
            myPlants.register(myAllPlantCollectionViewCell.self, forCellWithReuseIdentifier: myAllPlantCollectionViewCell.identifier)
        }
        
        // MARK: - UICollectionViewDataSource Methods
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            plants.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myAllPlantCollectionViewCell.identifier, for: indexPath) as? myAllPlantCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let plant = plants[indexPath.item]
            cell.configure(with: plant)
            return cell
        }
        
        // MARK: - UICollectionViewDelegateFlowLayout Methods
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.frame.width - 30) / 2 // Two items per row with spacing
            return CGSize(width: width, height: width * 1.5) // Adjust height ratio as needed
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let plant = plants[indexPath.item]
            print(plant.image)
            print(plant.name)
        }
    }
