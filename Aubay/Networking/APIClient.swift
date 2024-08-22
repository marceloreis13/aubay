//
//  APIClient.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import Foundation

protocol PopulationAPIClient {
    func fetchNationPopulation(completion: @escaping (Result<PopulationResponse, APIError>) -> Void)
    func fetchStatePopulation(completion: @escaping (Result<StatePopulationResponse, APIError>) -> Void)
}
