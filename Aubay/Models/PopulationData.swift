//
//  PopulationData.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import Foundation

struct PopulationResponse: Decodable {
    let data: [NationPopulationData]
}

struct NationPopulationData: Decodable, Identifiable {
    var id: UUID {
        return UUID()
    }
    
    let idNation: String
    let nation: String
    let idYear: Int
    let year: String
    let population: Int
    let slugNation: String
    
    enum CodingKeys: String, CodingKey {
        case idNation = "ID Nation"
        case nation = "Nation"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }
}
