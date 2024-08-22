//
//  PopulationViewModel.swift
//  Aubay
//
//  Created by Marcelo Reis on 22/08/2024.
//
import SwiftUI
import Combine

class PopulationViewModel: ObservableObject {
    @Published var populationData: [NationPopulationData] = []
    @Published var statePopulationData: [StatePopulationData] = []
    @Published var errorMessage: IdentifiableError? = nil
    
    private let apiClient: PopulationAPIClient
    
    init(apiClient: PopulationAPIClient = NetworkManager.shared) {
        self.apiClient = apiClient
    }
    
    func fetchNationPopulation() {
        apiClient.fetchNationPopulation { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.populationData = data.data
                case .failure(let error):
                    self?.errorMessage = IdentifiableError(message: error.localizedDescription)
                }
            }
        }
    }
    
    func fetchStatePopulation() {
        apiClient.fetchStatePopulation { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.statePopulationData = data.data
                case .failure(let error):
                    self?.errorMessage = IdentifiableError(message: error.localizedDescription)
                }
            }
        }
    }
}
