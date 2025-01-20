import Foundation

struct PlantScan {
    var id: UUID
    var image: String
    var name: String
    var description: String
    var scientificName: String
    var careSections: [CareSection]
    
}

class PlantScanModel {
    private var plantScans: [PlantScan] = []
    
    static var shared: PlantScanModel = PlantScanModel()
    
    private init() {}
    
    // Add plant scan and associate it with a user
    func addPlantScan(forUser userId: UUID, image: String, name: String, description: String, scientificName: String, careSections: [CareSection]) -> PlantScan? {
        let newPlantScan = PlantScan(
            id: UUID(),
            image: image,
            name: name,
            description: description,
            scientificName: scientificName,
            careSections: careSections
        )
        plantScans.append(newPlantScan)
        
        UserDataModel.shared.addPlantToUser(userId: userId, plantId: newPlantScan.id)
        return newPlantScan
    }
    
    // Get plant by UUID
    func getPlantById(id: UUID) -> PlantScan? {
        return plantScans.first { $0.id == id }
    }

    // Get all plant scans
    func getPlantScans() -> [PlantScan] {
        return plantScans
    }
    
    // Get care instructions for a specific title (e.g., "Watering") across all plants
    func getCareInstructions(forTitle title: String) -> [String] {
        var allInstructions: [String] = []
        
        for plant in plantScans {
            for careSection in plant.careSections {
                if careSection.title == title {
                    allInstructions.append(contentsOf: careSection.instructions)
                }
            }
        }
        
        return allInstructions
    }
    
    func generateDummyData() -> [PlantScan] {
        return [
            PlantScan(
                id: UUID(),
                image: "plant1.jpg",
                name: "Monstera",
                description: "A tropical plant with split leaves.",
                scientificName: "Monstera deliciosa",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water once a week.", "Allow soil to dry between waterings."]),
                    CareSection(title: "Lighting", instructions: ["Prefers indirect sunlight."]),
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant2.jpg",
                name: "Snake Plant",
                description: "A hardy, low-maintenance plant.",
                scientificName: "Sansevieria trifasciata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water once a month.", "Avoid overwatering."]),
                    CareSection(title: "Lighting", instructions: ["Tolerates low light.", "Thrives in bright, indirect light."]),
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant3.jpg",
                name: "Peace Lily",
                description: "A flowering plant with white blooms.",
                scientificName: "Spathiphyllum",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Keep soil consistently moist.", "Do not let it dry out."]),
                    CareSection(title: "Lighting", instructions: ["Best in medium, indirect light."]),
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant4.jpg",
                name: "Aloe Vera",
                description: "A succulent known for its medicinal properties.",
                scientificName: "Aloe barbadensis miller",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water every 2-3 weeks.", "Ensure proper drainage."]),
                    CareSection(title: "Lighting", instructions: ["Requires bright, indirect sunlight."]),
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant5.jpg",
                name: "Fiddle Leaf Fig",
                description: "A popular indoor plant with large, violin-shaped leaves.",
                scientificName: "Ficus lyrata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water every 1-2 weeks.", "Check soil moisture before watering."]),
                    CareSection(title: "Lighting", instructions: ["Needs bright, indirect light."]),
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant6.jpg",
                name: "Spider Plant",
                description: "A hardy plant with arching leaves and spiderettes.",
                scientificName: "Chlorophytum comosum",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water every 1-2 weeks.", "Do not let it sit in water."]),
                    CareSection(title: "Lighting", instructions: ["Thrives in bright, indirect sunlight."]),
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant7.jpg",
                name: "Rubber Plant",
                description: "An attractive plant with glossy leaves.",
                scientificName: "Ficus elastica",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water once a week.", "Reduce watering in winter."]),
                    CareSection(title: "Lighting", instructions: ["Needs bright, indirect light."]),
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant8.jpg",
                name: "Boston Fern",
                description: "A lush fern with arching fronds.",
                scientificName: "Nephrolepis exaltata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Keep soil moist.", "Mist regularly to increase humidity."]),
                    CareSection(title: "Lighting", instructions: ["Prefers indirect sunlight."]),
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant9.jpg",
                name: "Pothos",
                description: "A trailing plant that is easy to care for.",
                scientificName: "Epipremnum aureum",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water when soil is dry.", "Avoid overwatering."]),
                    CareSection(title: "Lighting", instructions: ["Adapts to low light.", "Thrives in bright, indirect light."]),
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant10.jpg",
                name: "Jade Plant",
                description: "A succulent with small, round leaves.",
                scientificName: "Crassula ovata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water every 2-3 weeks.", "Allow soil to dry completely."]),
                    CareSection(title: "Lighting", instructions: ["Needs bright sunlight."]),
                ]
            )
        ]
    }
}



