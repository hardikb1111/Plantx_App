import UIKit

class myPlantsCollectionViewController: UICollectionViewController {
    
    var plants: [PlantScan] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the custom collection view cell class (if using a nib or XIB)
        // If you're using a Storyboard, this is not required.
        
            // Register the custom collection view cell class (if not using Storyboard)
            collectionView.register(myPlantsCollectionViewCell.self, forCellWithReuseIdentifier: "PlantCell")
            
            // Configure collection view layout
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.itemSize = CGSize(width: 150, height: 200)
                layout.minimumInteritemSpacing = 10
                layout.minimumLineSpacing = 10
            }
            
            loadPlantsData()
        
    }
    
    // Load plants based on the logged-in user, or default data
    func loadPlantsData() {
        if UserDataModel.shared.getUsers(email: "dk@gmail.com") != nil {
            self.plants = getDefaultPlants()
        } else {
            self.plants = getDefaultPlants()
        }
        collectionView.reloadData()
    }
    
    // Default plants data if no user is logged in
    func getDefaultPlants() -> [PlantScan] {
        return [
            PlantScan(
                id: UUID(),
                image: "plant1",
                name: "Peace Lily",
                description: "A low-maintenance indoor plant.",
                scientificName: "Spathiphyllum",
                careSections: [
                    CareSection(
                        title: "Watering",
                        instructions: [
                            "Water once a week.",
                            "Keep soil slightly moist but not soggy."
                        ]
                    ),
                    CareSection(
                        title: "Sunlight",
                        instructions: [
                            "Prefers bright, indirect light.",
                            "Avoid direct sunlight to prevent leaf burn."
                        ]
                    ),
                    CareSection(
                        title: "Fertilizer",
                        instructions: [
                            "Fertilize once a month during growing season.",
                            "Use a balanced houseplant fertilizer."
                        ]
                    )
                ]
            ),
            // More plants...
        ]
    }

    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plants.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlantCell", for: indexPath) as? myPlantsCollectionViewCell {
            let plant = plants[indexPath.row]
            
            
            cell.plant_name.text = plant.name
            return cell
        } else {
            print("Failed to dequeue cell for indexPath: \(indexPath)")
            return UICollectionViewCell()
        }
    }

}

//repo updated here
