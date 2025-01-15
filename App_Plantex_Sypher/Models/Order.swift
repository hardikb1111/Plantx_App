//
//  Order.swift
//  App_Plantex_Sypher
//
//  Created by student-2 on 20/12/24.
//




import Foundation

struct Order {
    var id: UUID
    var userId: UUID
    var paymentMethod: String
    var deliveryAddress: String
    var items: [String]
    var totalAmount: Double
    var orderDate: Date
    var status: String
    
    
    init(userId: UUID, paymentMethod: String, deliveryAddress: String, items: [String], totalAmount: Double) {
        self.id = UUID()
        self.userId = userId
        self.paymentMethod = paymentMethod
        self.deliveryAddress = deliveryAddress
        self.items = items
        self.totalAmount = totalAmount
        self.orderDate = Date()
        self.status = "Pending"
    }
}
