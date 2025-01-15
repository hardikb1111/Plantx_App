//
//  CareModel.swift
//  App_Plantex_Sypher
//
//  Created by student-2 on 20/12/24.
//

struct CareSection {
    var title: String
    var instructions: [String]
}

let wateringSection = CareSection(title: "Watering", instructions: [
    "Water the plant twice a week.",
    "Avoid overwatering."
])

let sunlightSection = CareSection(title: "Sunlight", instructions: [
    "Keep the plant in indirect sunlight.",
    "Ensure 4 hours of sunlight per day."
])

class CareSectionModel {
    private var careSections: [CareSection] = []
    static var shared: CareSectionModel = CareSectionModel()
    
    private init() {}
    
    
    func addCareSection(section: CareSection) {
        careSections.append(section)
        print("Care section added successfully!")
    }
    
   
    func getCareSections() -> [CareSection] {
        return careSections
    }
    
    
}
