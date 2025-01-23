//
//  MockData.swift
//  App_Plantex_Sypher
//
//  Created by Hardik Bhardwaj on 22/01/25.
//


import Foundation

struct MockData {
    static let shared = MockData()
    private let weather : ListSection={
        . Weather ([.init(title: " ", image: "Screenshot 2025-01-21 at 8.56.25 PM")])
    }()
    
    private let Care: ListSection = {
            .Care([.init(title: "", image: "Garden Hoe_3D"),
                  .init(title: "", image: "Hedge trimmer_3D"),
                  .init(title: "", image: "Plant_3D"),
                  .init(title: "", image: "sprinkler pump_3D"),
                  .init(title: "", image: "water sprinkler_3D"),
                   .init(title: "", image: "seeds_3D"),
])
    }()
    
    private let Myplants: ListSection = {
        .Myplants([.init(title: "Pothos", image: "plant9.jpg"),
                  .init(title: "Boston Fern", image: "plant8.jpg"),])
    }()
    
    private let Recommended: ListSection = {
        .Recommended([.init(title: "Clay Soil", image: "soil2.png"),
                     .init(title: "Rich Soil", image: "soil1.png")])
    }()
    
    var pageData: [ListSection] {
        [weather, Care, Myplants,Recommended]
    }
}
