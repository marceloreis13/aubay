//
//  NetworkManager.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import Foundation

class NetworkManager: PopulationAPIClient {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchNationPopulation(completion: @escaping (Result<PopulationResponse, APIError>) -> Void) {
        guard let url = URL(string: API.nationPopulationURL()) else {
            completion(.failure(.invalidResponse))
            return
        }
        
        fetchData(url: url, completion: completion)
    }
    
    func fetchStatePopulation(completion: @escaping (Result<StatePopulationResponse, APIError>) -> Void) {
        guard let url = URL(string: API.statePopulationURL()) else {
            completion(.failure(.invalidResponse))
            return
        }
        
        fetchData(url: url, completion: completion)
    }
    
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, APIError>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.networkError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
