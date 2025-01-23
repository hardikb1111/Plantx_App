//
//  ListSection.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 22/01/25.
//


import Foundation

enum ListSection {
    case Weather([ListItem])
    case Care([ListItem])
    case Myplants([ListItem])
    case Recommended([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .Weather(let items),
                .Care(let items),
                .Myplants(let items),
                .Recommended(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .Weather:
            return "Weather"
        case .Care:
            return "Care"
        case .Myplants:
            return "MyPlants"
        case .Recommended:
            return "Recommended"
        
        }
    }
}
