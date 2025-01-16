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
        return soilScans
    }
}


