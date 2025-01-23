import Foundation

// Nutrient Value Enum
enum NutrientValue {
    case low
    case medium
    case high
}

// Nutrient Structure
struct Nutrient {
    var name: String
    var value: NutrientValue
    var quantity: String
}

struct RecommendedPlant {
    var name: String
    var image: String
}

struct SoilScane {
    var id: UUID
    var image: String
    var name: String
    var description: String
    var nutrients: [Nutrient]
    var recommendedPlants: [RecommendedPlant]
}

class SoilScanModel {
    private var soilScans: [SoilScane] = []
    
    static var shared: SoilScanModel = SoilScanModel()
    
    private init() {}
    
    func addSoilScan(soilScan: SoilScane) {
        soilScans.append(soilScan)
    }
    
    func getAllSoilScans() -> [SoilScane] {
        createDummyData()
        return soilScans
    }
    
    func getRecommendedPlants(forSoilName soilName: String) -> [RecommendedPlant] {
        guard let soil = soilScans.first(where: { $0.name.lowercased() == soilName.lowercased() }) else {
            return []
        }
        return soil.recommendedPlants
    }
    
    private func createDummyData() {
        if !soilScans.isEmpty { return } 
        
        let nutrients1 = [
            Nutrient(name: "Nitrogen", value: .high, quantity: "20%"),
            Nutrient(name: "Phosphorus", value: .medium, quantity: "15%"),
            Nutrient(name: "Potassium", value: .low, quantity: "5%")
        ]
        
        let nutrients2 = [
            Nutrient(name: "Nitrogen", value: .low, quantity: "10%"),
            Nutrient(name: "Phosphorus", value: .high, quantity: "25%"),
            Nutrient(name: "Potassium", value: .medium, quantity: "12%")
        ]
        
        let recommendedPlants1 = [
            RecommendedPlant(name: "Tomato", image: "tomato.png"),
            RecommendedPlant(name: "Lettuce", image: "lettuce.png")
        ]
        
        let recommendedPlants2 = [
            RecommendedPlant(name: "Carrot", image: "carrot.png"),
            RecommendedPlant(name: "Potato", image: "potato.png")
        ]
        
        let soilScan1 = SoilScane(
            id: UUID(),
            image: "soil1.png",
            name: "Rich Soil",
            description: "Soil rich in nitrogen and suitable for leafy vegetables.",
            nutrients: nutrients1,
            recommendedPlants: recommendedPlants1
        )
        
        let soilScan2 = SoilScane(
            id: UUID(),
            image: "soil2.png",
            name: "Clay Soil",
            description: "Clay soil with high phosphorus, ideal for root vegetables.",
            nutrients: nutrients2,
            recommendedPlants: recommendedPlants2
        )
        
        addSoilScan(soilScan: soilScan1)
        addSoilScan(soilScan: soilScan2)
    }
}

