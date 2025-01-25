//
//  PlantCare.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 25/01/25.
//

//
//  PlantCare.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 25/01/25.
//

import UIKit

// MARK: - PlantHealth Model
struct PlantHealth {
    var image: UIImage
    var name: String
    var isHealthy: Bool
}

// MARK: - PlantCareModel Class
class PlantCareModel {
    private var plants: [PlantHealth] = []

    static let shared = PlantCareModel()

    private init() {
        loadDummyData()
    }

    func addPlant(_ plant: PlantHealth) {
        plants.append(plant)
    }


    func removePlant(named name: String) {
        if let index = plants.firstIndex(where: { $0.name == name }) {
            plants.remove(at: index)
        } else {
            print("Plant with the name '\(name)' not found.")
        }
    }

    func getAllPlants() -> [PlantHealth] {
        return plants
    }

   
    func getHealthyPlants() -> [PlantHealth] {
        return plants.filter { $0.isHealthy }
    }

 
    func getUnhealthyPlants() -> [PlantHealth] {
        return plants.filter { !$0.isHealthy }
    }


    func printPlants() {
        for plant in plants {
            print("Name: \(plant.name), Healthy: \(plant.isHealthy)")
        }
    }
    private func loadDummyData() {
            let plant1 = PlantHealth(image: UIImage(named: "plant1") ?? UIImage(), name: "Rose", isHealthy: true)
            let plant2 = PlantHealth(image: UIImage(named: "plant2") ?? UIImage(), name: "Tulip", isHealthy: false)
            let plant3 = PlantHealth(image: UIImage(named: "plant3") ?? UIImage(), name: "Sunflower", isHealthy: true)
            let plant4 = PlantHealth(image: UIImage(named: "plant4") ?? UIImage(), name: "Lily", isHealthy: false)
            let plant5 = PlantHealth(image: UIImage(named: "plant5") ?? UIImage(), name: "Daisy", isHealthy: true)

            plants.append(contentsOf: [plant1, plant2, plant3, plant4, plant5])
        }

}
