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

// Dummy data for all the care sections
let wateringSection = CareSection(title: "Watering", instructions: [
    "Water the plant twice a week.",
    "Avoid overwatering."
])

let sunlightSection = CareSection(title: "Sunlight", instructions: [
    "Keep the plant in indirect sunlight.",
    "Ensure 4 hours of sunlight per day."
])

let fertilizingSection = CareSection(title: "Fertilizing", instructions: [
    "Use balanced fertilizer once a month.",
    "Avoid over-fertilizing, it can harm the plant."
])

let repottingSection = CareSection(title: "Repotting", instructions: [
    "Repot every two years.",
    "Choose a pot that’s 1-2 inches larger than the current one."
])

let pruningSection = CareSection(title: "Pruning", instructions: [
    "Trim dead or yellowing leaves regularly.",
    "Prune after flowering for a fresh bloom."
])

let pestsSection = CareSection(title: "Pests", instructions: [
    "Inspect the plant regularly for pests.",
    "Use insecticidal soap to treat common pests."
])

// Singleton Model class for managing care sections
class CareSectionModel {
    private var careSections: [CareSection] = []
    static var shared: CareSectionModel = CareSectionModel()
    
    private init() {
        // Adding all the sections here as dummy data
        careSections = [
            wateringSection,
            sunlightSection,
            fertilizingSection,
            repottingSection,
            pruningSection,
            pestsSection
        ]
    }
    
    func addCareSection(section: CareSection) {
        careSections.append(section)
        print("Care section added successfully!")
    }
    
    func getCareSections() -> [CareSection] {
        return careSections
    }
}
