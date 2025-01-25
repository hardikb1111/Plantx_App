//
//  CommunityViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 24/01/25.
//

import UIKit

class CommunityViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var CommunitiesCollectionViews: UICollectionView!
    
    var posts : [CommunityPost] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        posts = CommunityModel.shared.getAllPosts()
        
        // Register the custom cell class
        CommunitiesCollectionViews.register(CommunityCollectionViewCell.self, forCellWithReuseIdentifier: "CommunityPostCell")
        
        // Set up collection view
        CommunitiesCollectionViews.dataSource = self
        CommunitiesCollectionViews.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        posts = CommunityModel.shared.getAllPosts()
        CommunitiesCollectionViews.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(posts.count)
            return posts.count
        }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Safely dequeue the cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommunityPostCell", for: indexPath) as? CommunityCollectionViewCell {
            // Configure the cell with data
            let post = posts[indexPath.item]
            cell.configure(with: post)
            
            return cell
        } else {
            // Handle the error or return a default cell
            print("Error: Failed to dequeue cell for indexPath: \(indexPath)")
            return UICollectionViewCell() // Returning a default empty cell in case of error
        }
    }

        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Adjust the size of the cells as needed
            let width = collectionView.frame.width
            return CGSize(width: width, height: 400)
        }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("Post tapped: \(posts[indexPath.item].userName)")
        }

    

}
