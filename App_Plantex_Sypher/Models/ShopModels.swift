
import Foundation

struct Shop {
    var id: UUID
    var image: String
    var shopNameLabel: String
    var distance: String
    var timeTaken: String
}

class ShopModel {
    private var shops: [Shop] = []
    static var shared: ShopModel = ShopModel()

    private init() {
        // Initialize shop data
        shops = [
            Shop(id: UUID(), image: "shop", shopNameLabel: "Green Nursery", distance: "7 KM.", timeTaken: "15 min"),
            Shop(id: UUID(), image: "shop", shopNameLabel: "Flower Hub", distance: "4 KM.", timeTaken: "10 min."),
            Shop(id: UUID(), image: "shop", shopNameLabel: "Garden Essentials", distance: "11 KM.", timeTaken: "25 min."),
            Shop(id: UUID(), image: "shop", shopNameLabel: "Plant World", distance: "9 KM.", timeTaken: "20 min."),
            Shop(id: UUID(), image: "shop", shopNameLabel: "Urban Jungle", distance: "15 KM.", timeTaken: "30 min.")
        ]
    }

    func getShops() -> [Shop] {
        return shops
    }

    func getShopById(shopId: UUID) -> Shop? {
        return shops.first { $0.id == shopId }
    }

    func addShop(shop: Shop) {
        shops.append(shop)
    }
}

