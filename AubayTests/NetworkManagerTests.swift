//
//  NetworkManagerTests.swift
//  AubayTests
//
//  Created by Marcelo Reis on 22/08/2024.
//
import XCTest
@testable import Aubay

class NetworkManagerTests: XCTestCase {
    
    func testFetchNationPopulationSuccess() {
        let expectation = XCTestExpectation(description: "Fetch nation population data")
        
        NetworkManager.shared.fetchNationPopulation { result in
            switch result {
            case .success(let response):
                XCTAssertFalse(response.data.isEmpty, "Nation population data should not be empty")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected success but got \(error) instead")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchStatePopulationSuccess() {
        let expectation = XCTestExpectation(description: "Fetch state population data")
        
        NetworkManager.shared.fetchStatePopulation { result in
            switch result {
            case .success(let response):
                XCTAssertFalse(response.data.isEmpty, "State population data should not be empty")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected success but got \(error) instead")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchPopulationDataFailure() {
        let expectation = XCTestExpectation(description: "Fetch population data failure")
        
        // Simulate a failure by using an invalid URL
        let invalidURL = "https://invalidurl.com"
        NetworkManager.shared.fetchData(url: URL(string: invalidURL)!) { (result: Result<PopulationResponse, APIError>) in
            switch result {
            case .success:
                XCTFail("Expected failure but got success instead")
            case .failure(let error):
                XCTAssertEqual(error, .networkError, "Expected networkError but got \(error) instead")
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
