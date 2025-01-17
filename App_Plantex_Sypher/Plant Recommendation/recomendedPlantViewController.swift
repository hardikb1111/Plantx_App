//
//  recomendedPlantViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 16/01/25.
//

import UIKit

class recomendedPlantViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    

    @IBOutlet weak var recPlantView: UICollectionView!
    
    func createLayout() -> UICollectionViewLayout {
            return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(200))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging

                return section
            }
        }
    
    var plants: [PlantScan] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recPlantView.collectionViewLayout = createLayout()
        // Setup data source
        recPlantView.delegate = self
        recPlantView.dataSource = self
        
        
        plants = [
            PlantScan(
                id: UUID(),
                image: "plant1",
                name: "Fiddle Leaf Fig",
                description: "A popular indoor plant with large, glossy leaves.",
                scientificName: "Ficus lyrata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water once a week.", "Avoid overwatering."]),
                    CareSection(title: "Light", instructions: ["Bright, indirect sunlight."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant2",
                name: "Snake Plant",
                description: "A hardy plant that thrives in low light.",
                scientificName: "Sansevieria trifasciata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water every 2-3 weeks.", "Let soil dry between watering."]),
                    CareSection(title: "Light", instructions: ["Low to bright indirect light."])
                ]
            )
        ]
        
        // Reload collection view
        recPlantView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recomendedPlantCell", for: indexPath) as? recomendedPlantCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let plant = plants[indexPath.item]
        cell.plantName.text = plant.name
        cell.plantImg.image = UIImage(named: plant.image)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let plant = plants[indexPath.item]
        print("Selected plant: \(plant.name)")
    }
}
