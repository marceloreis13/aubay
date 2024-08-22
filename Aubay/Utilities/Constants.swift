//
//  Constants.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import Foundation

struct API {
    static let baseURL = "https://datausa.io/api/data"
    
    static func nationPopulationURL(year: String = "latest") -> String {
        return "\(baseURL)?drilldowns=Nation&measures=Population&year=\(year)"
    }
    
    static func statePopulationURL(year: String = "latest") -> String {
        return "\(baseURL)?drilldowns=State&measures=Population&year=\(year)"
    }
}
