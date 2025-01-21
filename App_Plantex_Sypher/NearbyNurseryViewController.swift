//
//  NearbyNurseryViewController.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 31/12/24.
//

import UIKit

class NearbyNurseryViewController: UIViewController {
    
    
    @IBOutlet weak var nearByShop: UITableView!
    
    let shopData = [
            (image: "shop1", title: "Green Nursery", subtitle: "Best Plants in Town", description: "Specialized in indoor plants."),
            (image: "shop2", title: "Flower Hub", subtitle: "Beautiful Flowers", description: "Fresh flowers daily."),
            (image: "shop3", title: "Garden Essentials", subtitle: "All for Your Garden", description: "From tools to seeds."),
            (image: "shop4", title: "Plant World", subtitle: "Exotic Plants", description: "Rare and exotic varieties."),
            (image: "shop5", title: "Urban Jungle", subtitle: "Modern Gardening", description: "Trendy and aesthetic plants.")
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set dataSource
            nearByShop.dataSource = self
            
            // Register the custom cell
            nearByShop.register(nearByShopTableViewCell.self, forCellReuseIdentifier: "NearbyNurseryCell")
        }
    }

    // MARK: - UITableViewDataSource
    extension NearbyNurseryViewController: UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return shopData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NearbyNurseryCell", for: indexPath) as? nearByShopTableViewCell else {
                return UITableViewCell()
            }
            
            let shop = shopData[indexPath.row]
            cell.locationImage.image = UIImage(named: shop.image)
            cell.shopNameLabel.text = shop.title
            cell.distance.text = shop.subtitle
            cell.timeTaken.text = shop.description
            
            return cell
        }
    }

extension NearbyNurseryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // Adjust the height as per your design
    }
}
