import Foundation

struct PaymentPage {
    var paymentMethods: [String]
    var deliveryAddresses: [String]
}

struct Orders {
    var userId: UUID
    var paymentMethod: String
    var deliveryAddress: String
    var items: [String]
    var totalAmount: Double
}

class PaymentModel {
    private var paymentPage: PaymentPage
    private var orders: [Order] = []
    private var users: [Userdata] = []

    static var shared: PaymentModel = PaymentModel()

    private init() {
        self.paymentPage = PaymentPage(paymentMethods: [], deliveryAddresses: [])
    }

    func addPaymentMethod(method: String) {
        paymentPage.paymentMethods.append(method)
        print("\(method) added to payment methods.")
    }

    func removePaymentMethod(method: String) {
        if let index = paymentPage.paymentMethods.firstIndex(of: method) {
            paymentPage.paymentMethods.remove(at: index)
            print("\(method) removed from payment methods.")
        } else {
            print("\(method) not found in payment methods.")
        }
    }

    func updatePaymentMethod(oldMethod: String, newMethod: String) {
        if let index = paymentPage.paymentMethods.firstIndex(of: oldMethod) {
            paymentPage.paymentMethods[index] = newMethod
            print("\(oldMethod) updated to \(newMethod).")
        } else {
            print("\(oldMethod) not found in payment methods.")
        }
    }

    func getPaymentMethods() -> [String] {
        return paymentPage.paymentMethods
    }

    func addDeliveryAddress(address: String) {
        paymentPage.deliveryAddresses.append(address)
        print("Delivery address \(address) added.")
    }

    func removeDeliveryAddress(address: String) {
        if let index = paymentPage.deliveryAddresses.firstIndex(of: address) {
            paymentPage.deliveryAddresses.remove(at: index)
            print("Delivery address \(address) removed.")
        } else {
            print("Address \(address) not found.")
        }
    }

    func updateDeliveryAddress(oldAddress: String, newAddress: String) {
        if let index = paymentPage.deliveryAddresses.firstIndex(of: oldAddress) {
            paymentPage.deliveryAddresses[index] = newAddress
            print("Address \(oldAddress) updated to \(newAddress).")
        } else {
            print("Address \(oldAddress) not found.")
        }
    }

    func getDeliveryAddresses() -> [String] {
        return paymentPage.deliveryAddresses
    }

    func resetPaymentPage() {
        paymentPage.paymentMethods.removeAll()
        paymentPage.deliveryAddresses.removeAll()
        print("Payment page has been reset.")
    }

    func createOrder(userId: UUID, paymentMethod: String, deliveryAddress: String, items: [String], totalAmount: Double) -> Order? {
        if let userIndex = users.firstIndex(where: { $0.id == userId }) {
            let newOrder = Order(userId: userId, paymentMethod: paymentMethod, deliveryAddress: deliveryAddress, items: items, totalAmount: totalAmount)
            orders.append(newOrder)
            print("Order created successfully for user ID: \(userId)")
            return newOrder
        } else {
            print("User with ID \(userId) not found.")
            return nil
        }
    }
}
