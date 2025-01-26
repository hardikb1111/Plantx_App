//
//  HomeViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit
enum CellType: Int {
    case weather = 0
    case careGrid
    case myPlants
    case mySoil
}

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,CareGridCellDelegate {

    @IBOutlet weak var homeCollectionViews: UICollectionView!
    
    var wether:[Wether] = []
    
    var plants: [PlantScan] = []
    var soil:[SoilScane]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plants = HomeModel.shared.getPlants()
        wether = HomeModel.shared.getWetherReports()
        soil = HomeModel.shared.getSoil()

        homeCollectionViews.register(wetherCellCollectionViewCell.self, forCellWithReuseIdentifier: "WetherCell")
        homeCollectionViews.register(CareGridCellCollectionViewCell.self, forCellWithReuseIdentifier: "CareGridCell")
        homeCollectionViews.register(allmyplantsCollectionViewCell.self, forCellWithReuseIdentifier: "MyPlantsCell")
        homeCollectionViews.register(mySoilCollectionViewCell.self, forCellWithReuseIdentifier: "SoilCollectionCell")
        homeCollectionViews.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)

        homeCollectionViews.delegate = self
        homeCollectionViews.dataSource = self
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 4
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            switch section {
            case CellType.weather.rawValue:
                return 1
            case CellType.careGrid.rawValue:
                return 1
            case CellType.myPlants.rawValue:
                return 2
            case CellType.mySoil.rawValue:
                return 2
            default:
                return 0
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch indexPath.section {
            case CellType.weather.rawValue:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WetherCell", for: indexPath) as! wetherCellCollectionViewCell
                cell.imageView.image = UIImage(named: "w")
                return cell
            case CellType.careGrid.rawValue:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CareGridCell", for: indexPath) as! CareGridCellCollectionViewCell
                cell.delegate = self
                return cell
            case CellType.myPlants.rawValue:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPlantsCell", for: indexPath) as! allmyplantsCollectionViewCell
                let plant = plants[indexPath.row]
                cell.configure(with: plant)
                return cell

            case CellType.mySoil.rawValue:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoilCollectionCell", for: indexPath) as! mySoilCollectionViewCell
                
                let soilscan = soil[indexPath.row]
                cell.configure(with: soilscan)
                return cell
                
            default:
                return UICollectionViewCell()
            }
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width
            let spacing: CGFloat = 10
            switch indexPath.section {
            case CellType.weather.rawValue:
                return CGSize(width: width, height: 200)
            case CellType.careGrid.rawValue:
                return CGSize(width: width, height: 300)
            case CellType.myPlants.rawValue:
                    let itemWidth = (width - spacing * 3) / 2
                    return CGSize(width: itemWidth, height: 250)
            case CellType.mySoil.rawValue:
                let itemWidth = (width - spacing * 3) / 2
                return CGSize(width: itemWidth, height: 250)
            default:
                return CGSize.zero
            }
        }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as! SectionHeaderView
            
            switch indexPath.section {
            case CellType.weather.rawValue:
                header.titleLabel.text = "Weather"
                // Hide the View All button for weather section
                header.viewAllButton.isHidden = true
            case CellType.careGrid.rawValue:
                header.titleLabel.text = "Care"
                // Show View All button for careGrid section
                header.viewAllButton.isHidden = true
                header.viewAllButton.tag = indexPath.section
                header.viewAllButton.isUserInteractionEnabled = true
                
            case CellType.myPlants.rawValue:
                header.titleLabel.text = "My Plants"
                // Show View All button for myPlants section
                header.viewAllButton.isHidden = false
                header.viewAllButton.tag = indexPath.section
                header.viewAllButton.isUserInteractionEnabled = true
                header.viewAllButton.addTarget(self, action: #selector(myPlantButtonTapped(_:)), for: .touchUpInside)
            case CellType.mySoil.rawValue:
                header.titleLabel.text = "My Soil"
                // Show View All button for mySoil section
                header.viewAllButton.isHidden = false
                header.viewAllButton.tag = indexPath.section
                header.viewAllButton.isUserInteractionEnabled = true
                header.viewAllButton.addTarget(self, action: #selector(soilButtonTapped(_:)), for: .touchUpInside)
            default:
                header.titleLabel.text = ""
                header.viewAllButton.isHidden = true
            }
            return header
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 50)
        }
    
//    @objc func careButtonTapped(_ sender: UIButton) {
//            print("View All button tapped for section \(sender.tag)")
//
//            let careButtonVC = CareButton()
//            careButtonVC.selectedCareTitle = "Care Button Title" // Set the title for the care button view controller
//            navigationController?.pushViewController(careButtonVC, animated: true)
//        }

   
    
    @objc func soilButtonTapped(_ sender: UIButton) {
        print("View All button tapped for section \(sender.tag)")

        let storyboard = UIStoryboard(name: "Soil", bundle: nil)
        guard let mysoil = storyboard.instantiateViewController(withIdentifier: "SoilRecomendedViewController") as? soilRecomendedViewController else {
            print("Failed to instantiate SoilRecomendedViewController")
            return
        }
        
        guard let navigationController = self.navigationController else {
            print("Navigation controller is nil")
            return
        }
        navigationController.pushViewController(mysoil, animated: true)
    }
    @objc func myPlantButtonTapped(_ sender: UIButton) {
        print("View All button tapped for section \(sender.tag)")

        let storyboard = UIStoryboard(name: "myPlant", bundle: nil)
        guard let mysoil = storyboard.instantiateViewController(withIdentifier: "myPlant") as? myAllPlantViewController else {
            print("Failed to instantiate SoilRecomendedViewController")
            return
        }
        
        guard let navigationController = self.navigationController else {
            print("Navigation controller is nil")
            return
        }
        navigationController.pushViewController(mysoil, animated: true)
    }
    
    func didTapCareButton(title: String) {
        // Instantiate CareButton view controller from storyboard
        let storyboard = UIStoryboard(name: "HomePage", bundle: nil)
        if let careButtonVC = storyboard.instantiateViewController(withIdentifier: "CareButton") as? CareButton {
            careButtonVC.selectedCareTitle = title
            navigationController?.pushViewController(careButtonVC, animated: true)
        }
    }

}
