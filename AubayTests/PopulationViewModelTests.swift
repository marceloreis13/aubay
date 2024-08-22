//
//  PopulationViewModelTests.swift
//  AubayTests
//
//  Created by Marcelo Reis on 22/08/2024.
//
import XCTest
@testable import Aubay

class PopulationViewModelTests: XCTestCase {
    var viewModel: PopulationViewModel!
    var mockAPIClient: MockAPIClient!
    
    override func setUp() {
        super.setUp()
        mockAPIClient = MockAPIClient()
        viewModel = PopulationViewModel(apiClient: mockAPIClient)
    }
    
    override func tearDown() {
        viewModel = nil
        mockAPIClient = nil
        super.tearDown()
    }
    
    func testFetchNationPopulationSuccess() {
        mockAPIClient.shouldReturnError = false
        viewModel.fetchNationPopulation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(self.viewModel.populationData.isEmpty, "Nation population data should not be empty")
            XCTAssertEqual(self.viewModel.populationData.first?.nation, "Mock Nation")
        }
    }
    
    func testFetchStatePopulationSuccess() {
        mockAPIClient.shouldReturnError = false
        viewModel.fetchStatePopulation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(self.viewModel.statePopulationData.isEmpty, "State population data should not be empty")
            XCTAssertEqual(self.viewModel.statePopulationData.first?.state, "Mock State")
        }
    }
    
    func testFetchNationPopulationFailure() {
        mockAPIClient.shouldReturnError = true
        viewModel.fetchNationPopulation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertNotNil(self.viewModel.errorMessage, "Error message should be set")
        }
    }
    
    func testFetchStatePopulationFailure() {
        mockAPIClient.shouldReturnError = true
        viewModel.fetchStatePopulation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertNotNil(self.viewModel.errorMessage, "Error message should be set")
        }
    }
}
