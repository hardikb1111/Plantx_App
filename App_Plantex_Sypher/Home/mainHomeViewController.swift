//
//  mainHomeViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 20/01/25.
//

import UIKit

class mainHomeViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var homeCollectionsView: UICollectionView!
    
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var CloudayWether: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    
    @IBOutlet weak var windName: UILabel!
    
    
    @IBOutlet weak var windSpeedValue: UILabel!
    
    @IBOutlet weak var Hum: UILabel!
    
    @IBOutlet weak var HumdiyValue: UILabel!
    
    var wether:[Wether] = []
    
    var plants: [PlantScan] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Retrieve plants data
        plants = HomeModel.shared.getPlants()
        wether = HomeModel.shared.getWetherReports()
        
        
        // Set up collection view
        setupCollectionView()
        displayWeatherData()
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
    
    
    private func displayWeatherData() {
        // Ensure you have valid weather data before accessing it
        
        print("Weather data: \(wether)") // Check if the array has data
        if let weather = wether.first {
            tempLabel.text = weather.temperature
            CloudayWether.text = "Cloudy"
            dateLable.text = weather.date
            windName.text = "Wind"
            windSpeedValue.text = weather.windSpeed
            Hum.text = "Humidity"
            HumdiyValue.text = weather.humidity
        }

    }

    
    
}
