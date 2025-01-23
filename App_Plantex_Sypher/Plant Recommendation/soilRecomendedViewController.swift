//
//  soilRecomendedViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit

class soilRecomendedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var mySoil: UICollectionView!
    
    var soil: [SoilScane] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            soil = SoilScanModel.shared.getAllSoilScans()
            
            mySoil?.dataSource = self
            mySoil?.delegate = self
            
            // Register the custom cell class
            mySoil?.register(soilRecomendedCollectionViewCell.self, forCellWithReuseIdentifier: "SoilCell")
        }
        
       
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return soil.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoilCell", for: indexPath) as? soilRecomendedCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            
            let soilData = soil[indexPath.item]
            cell.configure(with: soilData)
            
            return cell
        }
        
        // MARK: - UICollectionViewDelegateFlowLayout
        
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
            let selectedItem = soil[indexPath.item]
            
            // Navigate to soilRecPlantViewController
            let storyboard = UIStoryboard(name: "Soil", bundle: nil)
            if let detailVC = storyboard.instantiateViewController(withIdentifier: "soilRecPlant") as? soilRecPlantViewController {
                detailVC.soilScan = selectedItem // Correctly pass the selected soil data
                navigationController?.pushViewController(detailVC, animated: true)
            }
        }


}
