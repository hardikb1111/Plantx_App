//
//  SectionHeaderView.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 23/01/25.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    static let identifier = "SectionHeaderView"

        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = UIColor.systemGreen
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        let viewAllButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("View All", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(titleLabel)
            addSubview(viewAllButton)

            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

                viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                viewAllButton.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
        

