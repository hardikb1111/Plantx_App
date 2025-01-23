//
//  DiseaseModel.swift
//  App_Plantex_Sypher
//
//  Created by student-2 on 20/12/24.
//
import Foundation
import Foundation


struct Chemical {
    var name: String
    var value: Double
}


struct Disease {
    var id: UUID
    var diseaseName: String
    var scintificName: String
    var alsoKnownAs: [String]
    var diseaseImage: String
    var description: String
    var symptoms: [String]
    var solutions: [Chemical]
    var preventiveMeasures: [String]
    var plantIDs: [UUID]
}

// Example of a disease object with associated affected plant IDs

class DiseaseScanModel {
    private var diseaseScans: [Disease] = []
    static var shared: DiseaseScanModel = DiseaseScanModel()

    private init() {}

    // Add a new disease scan with affected plants
    func addDisease(
            diseaseName: String,
            scientificName: String,
            alsoKnownAs: [String],
            diseaseImage: String,
            description: String,
            symptoms: [String],
            solutions: [Chemical],
            preventiveMeasures: [String],
            plantIDs: [UUID]
        ) -> Disease {
            let newDisease = Disease(
                id: UUID(),
                diseaseName: diseaseName,
                scintificName: scientificName,
                alsoKnownAs: alsoKnownAs,
                diseaseImage: diseaseImage,
                description: description,
                symptoms: symptoms,
                solutions: solutions,
                preventiveMeasures: preventiveMeasures,
                plantIDs: plantIDs
            )
            diseaseScans.append(newDisease)
            return newDisease
        }
    // Retrieve all disease scans
    func getDiseaseScans() -> [Disease] {
        return diseaseScans
    }


    // Get diseases affecting a particular plant (by plant ID)
    func getDiseasesForPlant(plantId: UUID) -> [Disease] {
        return diseaseScans.filter { $0.plantIDs.contains(plantId) }
    }


    func getDiseaseSolutions(diseaseName: String) -> [Chemical]? {
        if let disease = diseaseScans.first(where: { $0.diseaseName == diseaseName }) {
            return disease.solutions
        }
        return nil
    }

    func removeDiseaseById(id: UUID) {
        if let index = diseaseScans.firstIndex(where: { $0.id == id }) {
            diseaseScans.remove(at: index)
            print("Disease with ID \(id) removed successfully!")
        } else {
            print("No disease found with ID \(id).")
        }
    }
}




