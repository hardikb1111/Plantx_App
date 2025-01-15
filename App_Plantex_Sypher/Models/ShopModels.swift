////
////  ShopModels.swift
////  App_Plantex_Sypher
////
////  Created by student-2 on 20/12/24.
////
//
//struct Shop {
//    var shopName: String
//    var price: Double
//    var image: String
//    var description: String
//}
//
//struct shopOnClick {
//    var shopName: String
//    var price: Double
//    var image: String
//    var description: String
//}
//struct shopCart {
//    var productName: String
//    var price: Double
//    var image: String
//    var quantity: Int
//
//
//}
//
//
//
//class ShopModel {
//    private var shops: [Shop] = []
//    private var cart: [(shop: Shop, quantity: Int)] = []
//
//    static var shared: ShopModel = ShopModel()
//
//    private init() {}
//
//    func addShop(shop: Shop) {
//        shops.append(shop)
//        print("Shop added successfully!")
//    }
//
//    func getShops() -> [Shop] {
//        return shops
//    }
//
//    func addToCart(shop: Shop, quantity: Int) {
//        for i in 0..<cart.count {
//            if cart[i].shop.shopName == shop.shopName {
//                cart[i].quantity += quantity
//                print("\(quantity) \(shop.shopName) added to cart.")
//                return
//            }
//        }
//        cart.append((shop, quantity))
//        print("\(quantity) \(shop.shopName) added to cart.")
//    }
//
//    func incrementQuantity(shop: Shop) {
//        for i in 0..<cart.count {
//            if cart[i].shop.shopName == shop.shopName {
//                cart[i].quantity += 1
//                print("Quantity of \(shop.shopName) increased by 1.")
//                return
//            }
//        }
//        print("\(shop.shopName) not in cart.")
//    }
//
//    func decrementQuantity(shop: Shop) {
//        for i in 0..<cart.count {
//            if cart[i].shop.shopName == shop.shopName {
//                if cart[i].quantity > 1 {
//                    cart[i].quantity -= 1
//                    print("Quantity of \(shop.shopName) decreased by 1.")
//                } else {
//                    print("Cannot decrement quantity of \(shop.shopName) further.")
//                }
//                return
//            }
//        }
//        print("\(shop.shopName) not in cart.")
//    }
//
//    func removeFromCart(shop: Shop) {
//        for i in 0..<cart.count {
//            if cart[i].shop.shopName == shop.shopName {
//                cart.remove(at: i)
//                print("\(shop.shopName) removed from cart.")
//                return
//            }
//        }
//        print("\(shop.shopName) not in cart.")
//    }
//
//    func checkout() {
//        var totalPrice = 0.0
//        for item in cart {
//            totalPrice += item.shop.price * Double(item.quantity)
//        }
//        cart.removeAll()
//        print("Checkout successful! Total price: \(totalPrice) USD.")
//    }
//}
