//
//  SoilModel.swift
//  App_Plantex_Sypher
//
//  Created by student-2 on 20/12/24.
//

import Foundation

enum NutrientValue {
    case low
    case medium
    case high
}

struct Nutrient {
    var name: String
    var value: NutrientValue
}

struct SoilScane {
    var id: UUID
    var image: String
    var name: String
    var description: String
    var nutrients: [Nutrient]
    var recommendedPlants: [PlantScan]
}

class SoilScanModel {
    private var soilScans: [SoilScane] = []
    
    static var shared: SoilScanModel = SoilScanModel()
    
    private init() {}

    func addSoilScan(id: UUID, image: String, name: String, description: String, nutrients: [Nutrient], recommendedPlants: [PlantScan]) {
        let newSoilScan = SoilScane(id: id, image: image, name: name, description: description, nutrients: nutrients, recommendedPlants: recommendedPlants)
        soilScans.append(newSoilScan)
    }

        
    func getAllSoilScans() -> [SoilScane] {
        return soilScans
    }
}
