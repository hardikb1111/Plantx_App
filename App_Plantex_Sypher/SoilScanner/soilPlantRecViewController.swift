//
//  soilPlantRecViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 25/01/25.
//

import UIKit

class soilPlantRecViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var RecPlantView: UICollectionView!
    
   
    var recommendedPlants: [RecommendedPlant] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RecPlantView.delegate = self
        RecPlantView.dataSource = self
        RecPlantView.register(soilPlantRec.self, forCellWithReuseIdentifier: soilPlantRec.identifier)
            
        
        let allSoilScans = SoilScanModel.shared.getAllSoilScans()
            print("Total soil scans available: \(allSoilScans.count)")
            
            // Debug recommended plants fetch
            recommendedPlants = SoilScanModel.shared.getRecommendedPlants(forSoilName: "Rich Soil")
            print("Recommended plants count: \(recommendedPlants.count)")
            
            RecPlantView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(recommendedPlants.count)
            return recommendedPlants.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            // Dequeue reusable cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "soilBasedPlantCell", for: indexPath) as! soilPlantRec
            
            // Get plant data
            let plant = recommendedPlants[indexPath.row]
            
            // Configure the cell
            cell.configure(with: plant)
            
            return cell
        }
        
        // MARK: - UICollectionView Delegate Methods (Optional)
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedPlant = recommendedPlants[indexPath.row]
            print("Selected plant: \(selectedPlant.name)")
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.frame.width - 30) / 2
            return CGSize(width: width, height: width * 1.5)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    }
    

   


