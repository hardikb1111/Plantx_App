//
//  WetherModel.swift
//  App_Plantex_Sypher
//
//  Created by student-2 on 20/12/24.
//
import Foundation

struct Wether {
    var id: UUID
    var date: String
    var temperature: String
    var humidity: String
    var windSpeed: String
    
}


// WeatherModel to manage the collection of Wether records
class WeatherModel {
    private var weatherRecords: [Wether] = []

    static var shared: WeatherModel = WeatherModel()

    private init() {}
    func addWether(date: String, temperature: String, humidity: String, windSpeed: String) -> Wether {
        let newWeather = Wether(id: UUID(), date: date, temperature: temperature, humidity: humidity, windSpeed: windSpeed)
        weatherRecords.append(newWeather)
        return newWeather
        
    }

    func getWeatherRecords() -> [Wether] {
        getDummyWeather()
        return weatherRecords
    }

        func deleteWeatherRecord(id: UUID) {
        if let index = weatherRecords.firstIndex(where: { $0.id == id }) {
            weatherRecords.remove(at: index)
        }
            
    }
    
    
    func getDummyWeather() {
        let dummyWeather =
            Wether(id: UUID(), date: "2024-01-01", temperature: "25°C", humidity: "60%", windSpeed: "10 km/h")
            
        weatherRecords.append(dummyWeather)
    }
}

