//
//  NearbyNurseryViewController.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 31/12/24.
//

import UIKit

class NearbyNurseryViewController: UIViewController {
    
    
    @IBOutlet weak var nearByShop: UITableView!
    
    var shopData :[Shop] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set dataSource
            nearByShop.dataSource = self
            nearByShop.delegate = self
            
            shopData = ShopModel.shared.getShops()
            
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
            cell.configure(with: shop)
            
            return cell
        }

    }

extension NearbyNurseryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 
    }
}
