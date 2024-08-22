//
//  MockAPIClient.swift
//  AubayTests
//
//  Created by Marcelo Reis on 22/08/2024.
//
import Foundation
@testable import Aubay

class MockAPIClient: PopulationAPIClient {
    var shouldReturnError = false
    
    func fetchNationPopulation(completion: @escaping (Result<PopulationResponse, APIError>) -> Void) {
        if shouldReturnError {
            completion(.failure(.networkError))
        } else {
            let mockData = PopulationResponse(data: [
                PopulationData(idNation: "01000US", nation: "Mock Nation", idYear: 2022, year: "2022", population: 123456, slugNation: "mock-nation")
            ])
            completion(.success(mockData))
        }
    }
    
    func fetchStatePopulation(completion: @escaping (Result<StatePopulationResponse, APIError>) -> Void) {
        if shouldReturnError {
            completion(.failure(.networkError))
        } else {
            let mockData = StatePopulationResponse(data: [
                StatePopulationData(idState: "04000US01", state: "Mock State", idYear: 2022, year: "2022", population: 789012, slugState: "mock-state")
            ])
            completion(.success(mockData))
        }
    }
}
