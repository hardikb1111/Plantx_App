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
                description: "Monstera is a tropical plant known for its iconic split leaves. It’s a popular indoor plant that thrives in warm, humid environments. Often called the 'Swiss Cheese Plant' due to the holes in its leaves, it can grow quite large, making it a stunning centerpiece for any home.",
                scientificName: "Monstera deliciosa",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water once a week.", "Allow soil to dry between waterings."]),
                    CareSection(title: "Lighting", instructions: ["Prefers indirect sunlight."]),
                    CareSection(title: "Harvesting", instructions: ["Cut mature leaves for propagation.", "Ensure at least one node is included for successful growth."]),
                    CareSection(title: "Pruning", instructions: ["Remove yellow or damaged leaves.", "Trim to control size and shape as needed."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant2.jpg",
                name: "Snake Plant",
                description: "The Snake Plant is a hardy, low-maintenance plant, perfect for beginners. It features tall, sword-shaped leaves with unique patterns and is known for its air-purifying properties. It’s highly adaptable and can survive in both low light and bright conditions.",
                scientificName: "Sansevieria trifasciata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water once a month.", "Avoid overwatering."]),
                    CareSection(title: "Lighting", instructions: ["Tolerates low light.", "Thrives in bright, indirect light."]),
                    CareSection(title: "Harvesting", instructions: ["Propagate by dividing the root ball.", "Best done during spring or summer."]),
                    CareSection(title: "Pruning", instructions: ["Remove older, damaged leaves.", "Trim leaves for aesthetic purposes if necessary."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant3.jpg",
                name: "Peace Lily",
                description: "Peace Lily is a beautiful flowering plant with lush, green foliage and elegant white blooms. It’s known for its ability to purify the air and thrives in medium, indirect light. A great choice for adding a touch of sophistication to any indoor space.",
                scientificName: "Spathiphyllum",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Keep soil consistently moist.", "Do not let it dry out."]),
                    CareSection(title: "Lighting", instructions: ["Best in medium, indirect light."]),
                    CareSection(title: "Harvesting", instructions: ["Cut flowers when they start to fade.", "Prune spent blooms to encourage new growth."]),
                    CareSection(title: "Pruning", instructions: ["Remove yellowing leaves to keep the plant healthy.", "Trim dead flowers regularly."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant4.jpg",
                name: "Aloe Vera",
                description: "Aloe Vera is a succulent known for its medicinal properties, particularly its soothing gel. It features thick, fleshy leaves that store water, making it drought-tolerant. Ideal for sunny windowsills, it adds a touch of greenery and functionality to your home.",
                scientificName: "Aloe barbadensis miller",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water every 2-3 weeks.", "Ensure proper drainage."]),
                    CareSection(title: "Lighting", instructions: ["Requires bright, indirect sunlight."]),
                    CareSection(title: "Harvesting", instructions: ["Cut mature leaves near the base.", "Use gel immediately or store in the fridge for later use."]),
                    CareSection(title: "Pruning", instructions: ["Remove older leaves that are yellowing or damaged.", "Trim off any brown tips to keep it looking neat."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant5.jpg",
                name: "Fiddle Leaf Fig",
                description: "The Fiddle Leaf Fig is a popular indoor plant known for its large, violin-shaped leaves. It’s a statement piece that requires consistent care to thrive. With the right lighting and watering, it can grow into a tall, bushy plant that transforms any room.",
                scientificName: "Ficus lyrata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water every 1-2 weeks.", "Check soil moisture before watering."]),
                    CareSection(title: "Lighting", instructions: ["Needs bright, indirect light."]),
                    CareSection(title: "Harvesting", instructions: ["Not typically harvested.", "Prune and propagate cuttings to grow new plants."]),
                    CareSection(title: "Pruning", instructions: ["Remove lower leaves to encourage upward growth.", "Trim to maintain its desired shape and size."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant6.jpg",
                name: "Spider Plant",
                description: "Spider Plants are hardy and forgiving plants that are perfect for beginners. They produce arching leaves and baby plants, called 'spiderettes,' that dangle from the parent plant. Known for purifying the air, they add a refreshing touch to any room.",
                scientificName: "Chlorophytum comosum",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water every 1-2 weeks.", "Do not let it sit in water."]),
                    CareSection(title: "Lighting", instructions: ["Thrives in bright, indirect sunlight."]),
                    CareSection(title: "Harvesting", instructions: ["Separate spiderettes for propagation.", "Plant them in soil or water to grow new plants."]),
                    CareSection(title: "Pruning", instructions: ["Trim brown tips from leaves.", "Remove old spiderettes to promote healthier growth."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant7.jpg",
                name: "Rubber Plant",
                description: "Rubber Plants are known for their glossy, dark green leaves and elegant appearance. They are easy to care for and can grow into a large, striking plant when given proper care. Ideal for bright indoor spaces, they add a bold touch to your home decor.",
                scientificName: "Ficus elastica",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water once a week.", "Reduce watering in winter."]),
                    CareSection(title: "Lighting", instructions: ["Needs bright, indirect light."]),
                    CareSection(title: "Harvesting", instructions: ["Not typically harvested.", "Take cuttings for propagation."]),
                    CareSection(title: "Pruning", instructions: ["Prune to shape the plant and remove leggy growth.", "Cut back to encourage bushier growth."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant8.jpg",
                name: "Boston Fern",
                description: "Boston Ferns are lush, green plants with arching fronds. They thrive in humid environments and are excellent for hanging baskets or pots. Their dense foliage adds a touch of natural beauty and helps purify indoor air.",
                scientificName: "Nephrolepis exaltata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Keep soil moist.", "Mist regularly to increase humidity."]),
                    CareSection(title: "Lighting", instructions: ["Prefers indirect sunlight."]),
                    CareSection(title: "Harvesting", instructions: ["Propagate by dividing the root ball.", "Best done during spring."]),
                    CareSection(title: "Pruning", instructions: ["Trim older fronds to encourage new growth.", "Remove brown or damaged leaves."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant9.jpg",
                name: "Pothos",
                description: "Pothos is a versatile, easy-to-care-for trailing plant. It features heart-shaped leaves that vary in color from solid green to variegated. Perfect for hanging baskets or shelves, it’s an excellent choice for beginners and experienced plant owners alike.",
                scientificName: "Epipremnum aureum",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water when soil is dry.", "Avoid overwatering."]),
                    CareSection(title: "Lighting", instructions: ["Adapts to low light.", "Thrives in bright, indirect light."]),
                    CareSection(title: "Harvesting", instructions: ["Take cuttings from the vines for propagation.", "Ensure each cutting has at least one node."]),
                    CareSection(title: "Pruning", instructions: ["Trim long vines to encourage bushier growth.", "Remove yellow leaves to maintain health."])
                ]
            ),
            PlantScan(
                id: UUID(),
                image: "plant10.jpg",
                name: "Jade Plant",
                description: "The Jade Plant is a succulent with thick, round leaves that symbolize prosperity and good fortune. It’s drought-tolerant and thrives in bright, sunny locations. Its compact, tree-like structure makes it a charming addition to any home or office.",
                scientificName: "Crassula ovata",
                careSections: [
                    CareSection(title: "Watering", instructions: ["Water every 2-3 weeks.", "Allow soil to dry completely."]),
                    CareSection(title: "Lighting", instructions: ["Needs bright sunlight."]),
                    CareSection(title: "Harvesting", instructions: ["Propagate by cutting leaves or stems.", "Allow cuttings to dry before planting."]),
                    CareSection(title: "Pruning", instructions: ["Prune to maintain shape and remove leggy growth.", "Cut back to encourage branching."])
                ]
            )
        ]
    }

}



