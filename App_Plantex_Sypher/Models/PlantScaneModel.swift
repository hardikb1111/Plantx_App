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
}



