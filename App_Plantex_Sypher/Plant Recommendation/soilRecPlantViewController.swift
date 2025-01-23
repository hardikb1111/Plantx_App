//
//  soilRecPlantViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit

class soilRecPlantViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var soilScan: SoilScane?
    
    
    @IBOutlet weak var recPlant: UICollectionView!
    
    
    var recommendedPlants: [RecommendedPlant] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        

                // If soilScan is available, get the recommended plants
                if let soilScan = soilScan {
                    recommendedPlants = soilScan.recommendedPlants
                }
                
        recPlant.dataSource = self
        recPlant.delegate = self
        recPlant.register(soilRecPlantCollectionViewCell.self, forCellWithReuseIdentifier: "soilRecPlant")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return recommendedPlants.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "soilRecPlant", for: indexPath) as? soilRecPlantCollectionViewCell else {
                return UICollectionViewCell()
            }

            let plant = recommendedPlants[indexPath.item]
            cell.configure(with: plant)
            
            return cell
        }

        // MARK: - UICollectionViewDelegateFlowLayout

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.frame.width - 30) / 2 // Adjust for your layout
            return CGSize(width: width, height: width * 1.5) // Adjust height ratio as needed
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    }
