//
//  StatePopulationData.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import Foundation

struct StatePopulationResponse: Decodable {
    let data: [StatePopulationData]
}

struct StatePopulationData: Decodable, Identifiable {
    var id: UUID {
        return UUID()
    }
    
    let idState: String
    let state: String
    let idYear: Int
    let year: String
    let population: Int
    let slugState: String
    
    enum CodingKeys: String, CodingKey {
        case idState = "ID State"
        case state = "State"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugState = "Slug State"
    }
}
