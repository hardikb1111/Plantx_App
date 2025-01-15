import Foundation
import CryptoKit

struct Userdata {
    var id: UUID
    var name: String
    var email: String
    var password: String
    var confirmPassword: String
    var phoneNumber: String
    var image: String
    var plantIDs: [UUID]?
}

class UserDataModel {
    private var users: [Userdata] = []
    private var plants: [PlantScan] = PlantScanModel.shared.getPlantScans()

    static var shared: UserDataModel = UserDataModel()

    private init() {}

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    private func hashPassword(_ password: String) -> String {
        let data = Data(password.utf8)
        let hash = SHA256.hash(data: data)
        return hash.map { String(format: "%02x", $0) }.joined()
    }

    func addUser(id: UUID, name: String, email: String, password: String, confirmPassword: String, phoneNumber: String, image: String, plantIDs: [UUID]? = nil) {
        guard isValidEmail(email) else {
            print("Invalid email address.")
            return
        }
        guard password == confirmPassword else {
            print("Passwords do not match.")
            return
        }
        guard phoneNumber.count == 10 else {
            print("Phone number must be 10 digits.")
            return
        }
        guard password.count >= 6 else {
            print("Password must be at least 6 characters.")
            return
        }
        
        let hashedPassword = hashPassword(password)
        let newUser = Userdata(id: id, name: name, email: email, password: hashedPassword, confirmPassword: hashedPassword, phoneNumber: phoneNumber, image: image, plantIDs: plantIDs)
        users.append(newUser)
    }

    
    func getUsers(email: String) -> Userdata? {
        return users.first(where: { $0.email == email })
    }


    func addPlantToUser(userId: UUID, plantId: UUID) {
        if let userIndex = users.firstIndex(where: { $0.id == userId }) {
            if users[userIndex].plantIDs == nil {
                users[userIndex].plantIDs = [plantId]
            } else {
                users[userIndex].plantIDs?.append(plantId)
            }
        }
    }

    func getProfileById(userId: UUID) -> (name: String, email: String, phoneNumber: String, plants: [PlantScan])? {
        if let user = users.first(where: { $0.id == userId }) {
            let userPlants = plants.filter { user.plantIDs?.contains($0.id) == true }
            return (user.name, user.email, user.phoneNumber, userPlants)
        }
        return nil
    }
}
