//
//  SoilAnalysisViewController.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 19/12/24.
//

import UIKit

struct SoilModel {
    let soilType: String
    let description: String
    let nitrogen: String
    let phosphorus: String
    let potassium: String
    let organicMatter: String
}

class SoilAnalysisViewController: UIViewController {

    // UI Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var nitrogenLabel: UILabel!
    @IBOutlet weak var phosphorusLabel: UILabel!
    @IBOutlet weak var potassiumLabel: UILabel!
    @IBOutlet weak var organicMatterLabel: UILabel!
    @IBOutlet weak var recommendButton: UIButton!

    // Soil data model
    var soilData: SoilModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        guard let soilData = soilData else { return }
        titleLabel.text = "Hurray, we identified the Soil!"
        subtitleLabel.text = soilData.soilType
        descriptionLabel.text = soilData.description
        nitrogenLabel.text = "N: \(soilData.nitrogen)"
        phosphorusLabel.text = "P: \(soilData.phosphorus)"
        potassiumLabel.text = "K: \(soilData.potassium)"
        organicMatterLabel.text = "Organic Matter: \(soilData.organicMatter)"
    }

//    @IBAction func recommendPlantTapped(_ sender: UIButton) {
//        let alert = UIAlertController(title: "Plant Recommendation", message: "We recommend rice or wheat for Alluvial soil.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        present(alert, animated: true, completion: nil)
//    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


